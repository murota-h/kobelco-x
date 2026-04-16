import 'dart:math';
import 'package:flutter/material.dart';
import '../data/quiz_data.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  static const Color _navy = Color(0xFF1a3a6b);
  static const Color _bg = Color(0xFFF5F7FA);

  late List<QuizQuestion> _questions;

  int _currentIndex = 0;
  int? _selectedIndex;
  bool _answered = false;
  int _score = 0;
  bool _completed = false;

  static const int _pickCount = 5;

  @override
  void initState() {
    super.initState();
    _questions = _pickRandom(quizQuestions, _pickCount);
  }

  List<QuizQuestion> _pickRandom(List<QuizQuestion> src, int count) {
    final list = List<QuizQuestion>.from(src);
    list.shuffle(Random());
    return list.take(count).toList();
  }

  void _selectOption(int index) {
    if (_answered) return;
    setState(() {
      _selectedIndex = index;
      _answered = true;
      if (index == _questions[_currentIndex].correctIndex) {
        _score++;
      }
    });
  }

  void _next() {
    if (_currentIndex + 1 >= _questions.length) {
      setState(() => _completed = true);
    } else {
      setState(() {
        _currentIndex++;
        _selectedIndex = null;
        _answered = false;
      });
    }
  }

  void _restart() {
    setState(() {
      _questions = _pickRandom(quizQuestions, _pickCount);
      _currentIndex = 0;
      _selectedIndex = null;
      _answered = false;
      _score = 0;
      _completed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_completed) return _scoreScreen();

    final q = _questions[_currentIndex];
    final total = _questions.length;
    final labels = ['A', 'B', 'C'];

    return Scaffold(
      backgroundColor: _bg,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 14),
              title: Text(
                'クイズ  ${_currentIndex + 1} / $total',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0a1c3d), Color(0xFF1a3a6b), Color(0xFF1e579b)],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 56),
                    child: Text(
                      '理解度チェック',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.65),
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: (_currentIndex + 1) / total,
                      backgroundColor: const Color(0xFFDDE6F5),
                      valueColor: const AlwaysStoppedAnimation(_navy),
                      minHeight: 5,
                    ),
                  ),
                  const SizedBox(height: 22),

                  // Question card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 9, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEF3FB),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Q${_currentIndex + 1}',
                            style: const TextStyle(
                              color: _navy,
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          q.question,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            height: 1.6,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Options
                  ...q.options.asMap().entries.map((e) {
                    final idx = e.key;
                    final text = e.value;
                    final isCorrect = idx == q.correctIndex;
                    final isSelected = idx == _selectedIndex;

                    Color bgColor = Colors.white;
                    Color borderColor = const Color(0xFFDDE6F5);
                    Color labelBg = const Color(0xFFEEF3FB);
                    Color labelFg = _navy;
                    Widget? trailing;

                    if (_answered) {
                      if (isCorrect) {
                        bgColor = const Color(0xFFE8F5E9);
                        borderColor = const Color(0xFF66BB6A);
                        labelBg = const Color(0xFF66BB6A);
                        labelFg = Colors.white;
                        trailing = const Icon(Icons.check_circle,
                            color: Color(0xFF43A047), size: 22);
                      } else if (isSelected) {
                        bgColor = const Color(0xFFFFEBEE);
                        borderColor = const Color(0xFFEF5350);
                        labelBg = const Color(0xFFEF5350);
                        labelFg = Colors.white;
                        trailing = const Icon(Icons.cancel,
                            color: Color(0xFFE53935), size: 22);
                      }
                    }

                    return GestureDetector(
                      onTap: () => _selectOption(idx),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(color: borderColor, width: 1.5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: labelBg,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                labels[idx],
                                style: TextStyle(
                                  color: labelFg,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                text,
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  height: 1.5,
                                  color: Color(0xFF333333),
                                ),
                              ),
                            ),
                            if (trailing != null) ...[
                              const SizedBox(width: 8),
                              trailing,
                            ],
                          ],
                        ),
                      ),
                    );
                  }),

                  // Explanation
                  if (_answered) ...[
                    const SizedBox(height: 10),
                    _explanationCard(q.explanation),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _next,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _navy,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          _currentIndex + 1 < total ? '次の問題へ' : '結果を見る',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _explanationCard(String explanation) {
    final isCorrect = _selectedIndex == _questions[_currentIndex].correctIndex;
    final color = isCorrect ? const Color(0xFF43A047) : const Color(0xFFFF8F00);
    final bgColor =
        isCorrect ? const Color(0xFFE8F5E9) : const Color(0xFFFFF8E1);
    final borderColor =
        isCorrect ? const Color(0xFFA5D6A7) : const Color(0xFFFFCC80);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(isCorrect ? Icons.check_circle : Icons.lightbulb,
                  color: color, size: 19),
              const SizedBox(width: 8),
              Text(
                isCorrect ? '正解！' : '解説',
                style: TextStyle(
                    color: color, fontWeight: FontWeight.w700, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            explanation,
            style: const TextStyle(
                fontSize: 14, height: 1.7, color: Color(0xFF444444)),
          ),
        ],
      ),
    );
  }

  Widget _scoreScreen() {
    final pct = (_score / _questions.length * 100).round();
    final String msg;
    final Color msgColor;
    final IconData msgIcon;

    if (pct == 100) {
      msg = '満点！完璧な理解度です！';
      msgColor = const Color(0xFF1a6b3a);
      msgIcon = Icons.emoji_events;
    } else if (pct >= 80) {
      msg = 'とても良い理解度です！';
      msgColor = _navy;
      msgIcon = Icons.thumb_up;
    } else if (pct >= 60) {
      msg = 'もう一度復習してみましょう';
      msgColor = const Color(0xFFE65100);
      msgIcon = Icons.school;
    } else {
      msg = '学習コンテンツを読み直してみましょう';
      msgColor = const Color(0xFFE53935);
      msgIcon = Icons.refresh;
    }

    return Scaffold(
      backgroundColor: _bg,
      appBar: AppBar(
        title: const Text('クイズ結果',
            style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _navy.withValues(alpha: 0.18),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$_score / ${_questions.length}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: _navy,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$pct%',
                      style: TextStyle(
                        fontSize: 15,
                        color: _navy.withValues(alpha: 0.55),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              Icon(msgIcon, size: 42, color: msgColor),
              const SizedBox(height: 14),
              Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: msgColor,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '問題の順番はランダムに変わります',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _restart,
                  icon: const Icon(Icons.shuffle),
                  label: const Text('シャッフルしてもう一度',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _navy,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
