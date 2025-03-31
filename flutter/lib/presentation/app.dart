import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import 'routes/app_routes.dart';
import 'screens/home/home_screen.dart';

class BibliaCatolicaApp extends StatelessWidget {
  const BibliaCatolicaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bíblia Católica',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      home: const HomeScreen(),
    );
  }
}