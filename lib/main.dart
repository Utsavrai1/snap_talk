import 'package:flutter/material.dart';
import 'package:snap_talk/screens/login_screen.dart';

void main() => runApp(const SnapTalkApp());

class SnapTalkApp extends StatelessWidget {
  const SnapTalkApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(143, 148, 251, 1),
      ),
      home: const LoginScreen(),
    );
  }
}
