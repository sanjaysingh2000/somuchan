import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:her_birthday/core/extensions/extensions.dart';
import 'package:vapinew/vapinew.dart';

class AiCall extends StatefulWidget {
  const AiCall({super.key});

  @override
  _AiCallState createState() => _AiCallState();
}

class _AiCallState extends State<AiCall> {
  String buttonText = 'Start Call';
  bool isLoading = false;
  bool isCallStarted = false;
  Vapi vapi = Vapi('57b0bcf1-b257-4cc0-a83d-c4d457fee3e2');

  _AiCallState() {
    vapi.onEvent.listen((event) {
      if (event.label == "call-start") {
        setState(() {
          buttonText = 'End Call';
          isLoading = false;
          isCallStarted = true;
        });
        print('call started');
      }
      if (event.label == "call-end") {
        setState(() {
          buttonText = 'Start Call';
          isLoading = false;
          isCallStarted = false;
        });
        print('call ended');
      }
      if (event.label == "message") {
        print(event.value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.withOpacity(0.8),
        title: Text(
          'AI Call',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),),  
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFCE4EC), Color(0xFFF8BBD0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sumo AI',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.pinkAccent.withOpacity(0.6),
                ),
              ),
              20.h,
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: isCallStarted
                      ? Colors.tealAccent.withOpacity(0.1)
                      : Colors.grey[800],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.tealAccent, width: 3),
                ),
                child: Icon(
                  isCallStarted ? Icons.call_end : Icons.mic,
                  size: 80,
                  color: Colors.tealAccent,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                isCallStarted ? "Call in Progress" : "Ready to start call",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
              20.h,
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent.withOpacity(0.6),
                  ),
                  onPressed: isLoading
                      ? null
                      : () async {
                          setState(() {
                            buttonText = 'Loading...';
                            isLoading = true;
                          });

                          if (!isCallStarted) {
                            await vapi.start(
                                assistant: {
                                  "voice": {
                                    "provider": "11labs",
                                    "voiceId": "burt",
                                  }
                                },
                                assistantId:
                                    'f8ff75d7-7347-4eff-a6cc-293008af1502');
                            // await vapi.start(assistant: {
                            //   "firstMessage": "Hello, I am an assistant.",
                            //   "model": {
                            //     "provider": "openai",
                            //     "model": "gpt-3.5-turbo",
                            //     "messages": [
                            //       {
                            //         "role": "system",
                            //         "content": "You are an assistant."
                            //       }
                            //     ]
                            //   },
                            //   //"voice": "jennifer-playht"
                            // });
                          } else {
                            await vapi.stop();
                          }
                        },
                  child: Text(
                    buttonText,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
