import 'package:flutter/material.dart';
import 'title_screen.dart';
import 'kobelco_x_screen.dart';
import 'tqm_screen.dart';
import 'quiz_screen.dart';
import 'glossary_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  static const _screens = [
    TitleScreen(),
    KobelcoXScreen(),
    TqmScreen(),
    QuizScreen(),
    GlossaryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.10),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 11,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'ホーム',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.transform_outlined),
              activeIcon: Icon(Icons.transform),
              label: 'KOBELCO-X',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.workspace_premium_outlined),
              activeIcon: Icon(Icons.workspace_premium),
              label: 'TQM',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.quiz_outlined),
              activeIcon: Icon(Icons.quiz),
              label: 'クイズ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined),
              activeIcon: Icon(Icons.menu_book),
              label: '用語解説',
            ),
          ],
        ),
      ),
    );
  }
}
