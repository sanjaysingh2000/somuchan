import 'package:flutter/material.dart';
import 'package:her_birthday/core/token_storage/token_storage.dart';
import 'package:her_birthday/di/di.dart';
import 'package:her_birthday/features/ai_chat/presentation/ai_chat.dart';

class MeetYourAi extends StatefulWidget {
  const MeetYourAi({super.key});

  @override
  State<MeetYourAi> createState() => _MeetYourAiState();
}

class _MeetYourAiState extends State<MeetYourAi> {

   

  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'icon': Icons.smart_toy,
      'title': 'Meet Your AI Buddy',
      'desc': 'A smart companion to chat, help, and have fun with.',
    },
    {
      'icon': Icons.music_note,
      'title': 'Ask Anything',
      'desc': 'questions, advice, jokes — you name it!',
    },
    {
      'icon': Icons.chat_bubble_outline,
      'title': 'What\'s on Your Mind?',
      'desc': 'Talk about your day or explore random thoughts.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final page = _pages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(page['icon'], color: Colors.deepPurple, size: 100),
                      const SizedBox(height: 30),
                      Text(
                        page['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        page['desc'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pages.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: _currentPage == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      _currentPage == index ? Colors.deepPurple : Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: ElevatedButton(
              onPressed: () async{
                if (_currentPage < _pages.length - 1) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  await getIt<TokenStorage>().saveBirthdaySetup('setupdone');
                  // On the last page – navigate to AI feature screen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AiChatScreen()), // Replace with your screen
                            (route) => false,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                _currentPage == _pages.length - 1 ? "Get Started" : "Next",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
