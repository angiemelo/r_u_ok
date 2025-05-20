import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';


class MessagesPage extends StatelessWidget {
  final String mood;
  const MessagesPage({super.key, required this.mood});
  
  @override
  Widget build(BuildContext context) {
    final List<String> yesResponses = [
      "Yes! Let's get ready for the workout. 💪",
      "The dumbbells are calling! 🍑",
      "Coffee tiiiiime! ☕",
      "Good morning sunshine! 🌞",
      "Coffee in bed? What a dream! Yes, a total dream... 🤪",
    ];

    final List<String> noResponses = [
      "Would you like me to play your favourite song? 🫶",
      "How about a bit of music to lift your mood? 🔥",
      "Ready to feel a little better after some headbanging? 🤘",
      "Mr Manson is calling... 😏",
      "I know what you need. Some good old heavy metal! 🤘",
    ];

    String message = mood == 'yes'
        ? yesResponses[Random().nextInt(yesResponses.length)]
        : noResponses[Random().nextInt(noResponses.length)];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(message, style: const TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                ElevatedButton.icon(
                  style: Theme.of(context).elevatedButtonTheme.style,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text("Back"), 
                  onPressed: () {
                    Navigator.pop(context);
                  }
                ),
                const SizedBox(width: 10),
                
                // Custom action for "No" response - Spotify
                if (mood == 'no') 
                  ElevatedButton.icon(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () => openSpotify(),
                    icon: const Text("🤘"),
                    label: const Text("Hit it!"),
                  ),
              ],
            ),
          ],
        ),  
      ),
    );
  }

  
  void openSpotify() async {
    final Uri url = Uri.parse('https://open.spotify.com/playlist/6cfkcw4AdJiyliXZpQWL50?si=X01Q-8fiQeKu8Pi9MxkPgg'); // cool kid playlist
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}