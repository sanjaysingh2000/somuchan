// import 'dart:convert';
// import 'dart:io';
// import 'package:her_birthday/core/widgets/animation_widgets/app_loader.dart';
// import 'package:image/image.dart' as img;
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:her_birthday/features/crush/happy_birthday.dart';

// class CrushScreen extends StatefulWidget {
//   const CrushScreen({super.key});

//   @override
//   State<CrushScreen> createState() => _CrushScreenState();
// }

// class _CrushScreenState extends State<CrushScreen> {
//   bool isLoading = false;

//   Future<void> _uploadImageToFirebase(XFile file) async {
//     try {
//       print("Processing and uploading image...");

//       if (file.path.isEmpty) {
//         print("File path is empty, cannot process image");
//         return;
//       }

//       // Read the file as bytes
//       final bytes = await File(file.path).readAsBytes();

//       // Decode the image
//       img.Image? originalImage = img.decodeImage(bytes);

//       if (originalImage == null) {
//         print("Could not decode image");
//         return;
//       }

//       // Compress the image (reduce quality to 50%)
//       final compressedBytes = img.encodeJpg(originalImage, quality: 75);

//       // Convert compressed bytes to Base64
//       final base64Image = base64Encode(compressedBytes);

//       // Store Base64 image string in Firebase Realtime Database
//       await _storeBase64ImageInFirestore(base64Image);

//       print("Base64 Image uploaded successfully!");
//     } catch (e) {
//       print("Error processing/uploading image: $e");
//     }
//   }

//   Future<void> _storeBase64ImageInFirestore(String base64Image) async {
//     try {
//       final firestoreRef =
//           FirebaseFirestore.instance.collection('birthday_images');
//       isLoading = true;
//       setState(() {});
//       await firestoreRef.add({
//         'base64': base64Image,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//       isLoading = false;
//       setState(() {});

//       print("Base64 Image stored in Firestore!");
//     } catch (e) {
//       print("Error storing Base64 image in Firestore: $e");
//     }
//   }

//   Future<void> _openFrontCamera(BuildContext context) async {
//     isLoading = true;
//     setState(() {});
//     final ImagePicker _picker = ImagePicker();
//     final XFile? photo = await _picker.pickImage(
//       source: ImageSource.camera,
//       preferredCameraDevice: CameraDevice.front,
//     );

//     if (photo != null) {
//       await _uploadImageToFirebase(photo);
//       final File imageFile = File(photo.path);

//       Navigator.push(context, MaterialPageRoute(
//         builder: (context) {
//           return HappyBirthdayScreen(
//             imageFile: imageFile,
//           );
//         },
//       ));
//       // You can navigate to another screen or display the image here
//     } else {
//       // Navigator.pop(context);
//       isLoading = false;
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFE1BEE7), Color(0xFFBA68C8)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         width: double.infinity,
//         height: double.infinity,
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
//         child: isLoading
//             ? const SizedBox(height: 30, child: AppLoader())
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(
//                     Icons.favorite,
//                     color: Colors.white,
//                     size: 80,
//                   ),
//                   const SizedBox(height: 30),

//                   // Main romantic text
//                   const Text(
//                     'Do you know the most beautiful girl\nin this world?',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                       height: 1.4,
//                       letterSpacing: 0.5,
//                     ),
//                   ),
//                   const SizedBox(height: 40),

//                   // Camera button
//                   ElevatedButton.icon(
//                     onPressed: () => _openFrontCamera(context),
//                     icon: const Icon(Icons.camera_alt_rounded,
//                         color: Colors.white),
//                     label: const Text(
//                       'Click here to see her',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.purple[700],
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 30, vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       elevation: 10,
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
