import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'pages/mood_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'r u ok?',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 110, 69, 179),
            brightness: Brightness.dark,
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 110, 69, 179), // Global background
          
          textTheme: const TextTheme(
            headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
            bodyMedium: TextStyle(fontSize: 18, color: Color.fromARGB(237, 255, 255, 255)),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 64, 27, 90)),
              padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            ),
          ),
        ),
        home: MoodPage(),
      ),
    );
  }
}