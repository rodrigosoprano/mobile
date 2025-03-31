import 'package:flutter/material.dart';
import '../bible/bible_screen.dart';
import '../prayers/prayers_screen.dart';
import '../calendar/calendar_screen.dart';
import '../settings/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    BibleScreen(),
    PrayersScreen(),
    CalendarScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.book),
            label: 'Bíblia',
          ),
          NavigationDestination(
            icon: Icon(Icons.church),
            label: 'Orações',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            label: 'Calendário',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}