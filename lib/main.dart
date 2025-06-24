import 'package:flutter/material.dart';
import 'package:flutter_bible_app/ui/pages/splash_page.dart';
import 'package:flutter_bible_app/config/dependencies.dart';
import 'ui/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bíblia Almeida',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {'/home': (context) => const HomePage()},
      home: SplashPage(),
    );
  }
}
