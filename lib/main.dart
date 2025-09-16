import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:login_page/auth_gate.dart';
// import 'package:login_page/login_page.dart';
import 'firebase_options.dart';
import 'screens/coffee_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
      ),
      home: const CoffeeListScreen(), // langsung ke CoffeeListScreen
    );
  }
}
