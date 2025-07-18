import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:style_scout/firebase_options.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const StyleScoutApp());
}

class StyleScoutApp extends StatelessWidget {
  const StyleScoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Style Scout",
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F23),
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFFE94560),
      ),
      home: const Scaffold(body: Center(child: Text('Firebase Connected!'))),
    );
  }
}
