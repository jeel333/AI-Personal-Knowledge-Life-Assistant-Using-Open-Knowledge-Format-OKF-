
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LifeAssistantApp());
}

class LifeAssistantApp extends StatelessWidget {
  const LifeAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Assistant',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      home: const MainScreen(),
    );
  }
}
