import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import 'messages_page.dart';

class MoodPage extends StatelessWidget {
  const MoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("r u ok? 🤍", style: Theme.of(context).textTheme.headlineLarge), // Uses global text style
            const SizedBox(height: 30),
            MoodButtons(appState: appState), // Uses global button styling
          ],
        ),
      ),
    );
  }
}

class MoodButtons extends StatefulWidget {
  final MyAppState appState;
  const MoodButtons({super.key, required this.appState});

  @override
  State<MoodButtons> createState() => _MoodButtonsState();
}

class _MoodButtonsState extends State<MoodButtons> {
  bool isLiked = false; // Tracks 'Yes' button press state
  bool isDisliked = false; // Tracks 'No' button state

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          style: Theme.of(context).elevatedButtonTheme.style, 
          onPressed: () {
            setState(() {
              isLiked = !isLiked; // Toggle icon state
            });
            widget.appState.setUserMood('yes'); 
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MessagesPage(mood: 'yes'),
              ),
            );
          },
          icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border), // Changes dynamically
          label: const Text("Yes"),
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          style: Theme.of(context).elevatedButtonTheme.style, 
          onPressed: () {
            setState(() {
              isDisliked = !isDisliked;
            });
            widget.appState.setUserMood('no'); 
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MessagesPage(mood: 'no'),
              ),
            );
          },
          icon: Icon(isDisliked ? Icons.heart_broken : Icons.heart_broken_outlined), // Changes dynamically
          label: const Text("No"),
        ),
      ],
    );
  }
}