
import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'home_screen.dart';
import 'ai_assistant_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  void navigateTo(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(onNavigate: navigateTo),
      const PlaceholderScreen(
        title: 'Tasks',
        icon: Icons.check_circle_outline,
      ),
      const PlaceholderScreen(
        title: 'Events',
        icon: Icons.calendar_month_outlined,
      ),
      const PlaceholderScreen(
        title: 'Notes',
        icon: Icons.note_alt_outlined,
      ),
      const AiAssistantScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.border),
          ),
        ),
        child: NavigationBar(
          backgroundColor: AppColors.surface,
          indicatorColor:
              AppColors.primary.withValues(alpha: 0.18),
          selectedIndex: selectedIndex,
          onDestinationSelected: navigateTo,
          labelBehavior:
              NavigationDestinationLabelBehavior.alwaysShow,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.check_circle_outline),
              selectedIcon: Icon(Icons.check_circle),
              label: 'Tasks',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month),
              label: 'Events',
            ),
            NavigationDestination(
              icon: Icon(Icons.note_alt_outlined),
              selectedIcon: Icon(Icons.note_alt),
              label: 'Notes',
            ),
            NavigationDestination(
              icon: Icon(Icons.auto_awesome_outlined),
              selectedIcon: Icon(Icons.auto_awesome),
              label: 'AI',
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final IconData icon;

  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 55,
              color: AppColors.primary,
            ),
            const SizedBox(height: 18),
            Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Coming soon',
              style: TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
