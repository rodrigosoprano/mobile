import 'package:flutter/material.dart';
import '../screens/bible/bible_screen.dart';
import '../screens/prayers/prayers_screen.dart';
import '../screens/calendar/calendar_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/home/home_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String bible = '/bible';
  static const String prayers = '/prayers';
  static const String calendar = '/calendar';
  static const String settings = '/settings';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case bible:
        return MaterialPageRoute(builder: (_) => const BibleScreen());
      case prayers:
        return MaterialPageRoute(builder: (_) => const PrayersScreen());
      case calendar:
        return MaterialPageRoute(builder: (_) => const CalendarScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Rota não encontrada: ${settings.name}')),
          ),
        );
    }
  }
}