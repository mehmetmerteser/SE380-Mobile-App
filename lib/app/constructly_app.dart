import 'package:flutter/material.dart';

import '../core/theme/constructly_theme.dart';
import '../features/auth/presentation/login_screen.dart';

class ConstructlyApp extends StatelessWidget {
  const ConstructlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Constructly',
      debugShowCheckedModeBanner: false,
      theme: ConstructlyTheme.light,
      home: const LoginScreen(),
    );
  }
}
