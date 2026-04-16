import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const KobelcoXApp());
}

class KobelcoXApp extends StatelessWidget {
  const KobelcoXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KOBELCO-X',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1a3a6b),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1a3a6b),
          foregroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF1a3a6b),
          unselectedItemColor: Color(0xFFAAAAAA),
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w600, fontSize: 11.5),
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w400, fontSize: 11.5),
          elevation: 0,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
