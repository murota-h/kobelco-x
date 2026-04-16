import 'package:flutter/material.dart';
import 'kobelco_x_screen.dart';
import 'tqm_screen.dart';
import 'history_screen.dart';
import 'quiz_screen.dart';
import 'glossary_screen.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen>
    with TickerProviderStateMixin {
  static const Color _navy = Color(0xFF0D1F3C);

  late final AnimationController _headerCtrl;
  late final AnimationController _cardsCtrl;

  late final Animation<double> _logoFade;
  late final Animation<double> _logoScale;
  late final Animation<double> _titleFade;
  late final Animation<Offset> _titleSlide;
  late final Animation<double> _subtitleFade;

  final List<Animation<Offset>> _cardSlides = [];
  final List<Animation<double>> _cardFades = [];

  @override
  void initState() {
    super.initState();

    // ゆっくり・大きく動かす
    _headerCtrl = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );
    _cardsCtrl = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );

    _logoFade = CurvedAnimation(
        parent: _headerCtrl,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut));
    _logoScale = Tween<double>(begin: 0.45, end: 1.0).animate(CurvedAnimation(
        parent: _headerCtrl,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack)));
    _titleFade = CurvedAnimation(
        parent: _headerCtrl,
        curve: const Interval(0.3, 0.75, curve: Curves.easeOut));
    _titleSlide = Tween<Offset>(
            begin: const Offset(0, 0.6), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _headerCtrl,
            curve: const Interval(0.3, 0.75, curve: Curves.easeOutCubic)));
    _subtitleFade = CurvedAnimation(
        parent: _headerCtrl,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut));

    for (int i = 0; i < 5; i++) {
      final start = (i * 0.15).clamp(0.0, 0.55);
      final end   = (start + 0.45).clamp(0.0, 1.0);
      _cardSlides.add(
        Tween<Offset>(begin: const Offset(0, 0.7), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _cardsCtrl,
            curve: Interval(start, end, curve: Curves.easeOutCubic),
          ),
        ),
      );
      _cardFades.add(
        CurvedAnimation(
          parent: _cardsCtrl,
          curve: Interval(start, end, curve: Curves.easeOut),
        ),
      );
    }

    // addPostFrameCallback で描画後に確実に起動
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _headerCtrl.forward();
        Future.delayed(const Duration(milliseconds: 700), () {
          if (mounted) _cardsCtrl.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    _headerCtrl.dispose();
    _cardsCtrl.dispose();
    super.dispose();
  }

  void _showDisclaimer(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF3FB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.public, color: Color(0xFF1a3a6b), size: 20),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'PUBLIC INFORMATION ONLY',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1a3a6b),
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'このアプリに含まれるすべての情報は、神戸製鋼所の公式ウェブサイト・プレスリリース・IR資料・統合報告書等の一般公開情報のみを出典としています。\n\n機密情報および社外秘情報は一切含まれておりません。',
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.75,
                  color: Color(0xFF444444),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    '閉じる',
                    style: TextStyle(
                      color: Color(0xFF1a3a6b),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── ゴールドグラデーションテキスト ──
  Widget _goldText(String text,
      {double fontSize = 44,
      FontWeight weight = FontWeight.w900,
      double letterSpacing = 2.5}) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFFB8902A),
          Color(0xFFFFE17A),
          Color(0xFFF5C842),
          Color(0xFFFFEFA0),
          Color(0xFFD4A030),
          Color(0xFFFFE17A),
          Color(0xFFB8902A),
        ],
        stops: [0.0, 0.15, 0.35, 0.5, 0.65, 0.85, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: weight,
          letterSpacing: letterSpacing,
          height: 1.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FA),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFECF1FA),
              Color(0xFFF8FAFF),
              Color(0xFFEEF3F8),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: size.height - 80),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ── 情報アイコン（右上）──
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6, right: 4),
                        child: IconButton(
                          icon: Icon(
                            Icons.public_outlined,
                            size: 20,
                            color: _navy.withValues(alpha: 0.35),
                          ),
                          tooltip: '情報ソースについて',
                          onPressed: () => _showDisclaimer(context),
                        ),
                      ),
                    ),

                    // ── ヘッダー：ロゴ + タイトル ──
                    _buildHeader(),

                    const SizedBox(height: 32),

                    // ── メイン3カード ──
                    _buildMainCard(
                      index: 0,
                      title: 'KOBELCO-X',
                      subtitle: '変革戦略',
                      description: '7つの変革で2030年度 売上高3兆円へ',
                      icon: Icons.transform,
                      accentColor: const Color(0xFF1a3a6b),
                      destination: const KobelcoXScreen(),
                    ),
                    const SizedBox(height: 12),
                    _buildMainCard(
                      index: 1,
                      title: 'KOBELCO TQM',
                      subtitle: '総合的品質管理',
                      description: '全員参加の品質活動 — 2024年 奨励賞受賞',
                      icon: Icons.workspace_premium,
                      accentColor: const Color(0xFF1a5a3a),
                      destination: const TqmScreen(),
                    ),
                    const SizedBox(height: 12),
                    _buildMainCard(
                      index: 2,
                      title: 'KOBELCOの歴史',
                      subtitle: '1905年創業〜現在',
                      description: '120年以上の挑戦と変革の軌跡',
                      icon: Icons.history_edu,
                      accentColor: const Color(0xFF5D3A1A),
                      destination: const HistoryScreen(),
                    ),

                    const SizedBox(height: 24),

                    // ── 区切り ──
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            '学習ツール',
                            style: TextStyle(
                              fontSize: 11.5,
                              color: Colors.grey.shade500,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // ── サブカード2枚 ──
                    Row(
                      children: [
                        _buildSubCard(
                          index: 3,
                          title: 'クイズ',
                          subtitle: '理解度チェック',
                          icon: Icons.quiz,
                          color: const Color(0xFF1a3a6b),
                          destination: const QuizScreen(),
                        ),
                        const SizedBox(width: 12),
                        _buildSubCard(
                          index: 4,
                          title: '用語解説',
                          subtitle: '専門用語辞典',
                          icon: Icons.menu_book,
                          color: const Color(0xFF1a5a3a),
                          destination: const GlossaryScreen(),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // ── フッター ──
                    Text(
                      '株式会社神戸製鋼所  ／  1905年創業',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade400,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ──────────────────────────────────────────
  Widget _buildHeader() {
    return Column(
      children: [
        // ロゴ
        FadeTransition(
          opacity: _logoFade,
          child: ScaleTransition(
            scale: _logoScale,
            child: Image.asset(
              'assets/images/logo.png',
              height: 110,
              errorBuilder: (_, _, _) => Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0D1F3C), Color(0xFF1a3a6b)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1a3a6b).withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  'X',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        // KOBELCO-X ゴールドテキスト
        SlideTransition(
          position: _titleSlide,
          child: FadeTransition(
            opacity: _titleFade,
            child: Column(
              children: [
                FadeTransition(
                  opacity: _subtitleFade,
                  child: Text(
                    'KOBELCO',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: _navy.withValues(alpha: 0.45),
                      letterSpacing: 6,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                _goldText('KOBELCO-X', fontSize: 42, letterSpacing: 3),
                const SizedBox(height: 8),
                FadeTransition(
                  opacity: _subtitleFade,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 28,
                        height: 1,
                        color: const Color(0xFFD4A030).withValues(alpha: 0.5),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '変革ポータル',
                        style: TextStyle(
                          fontSize: 13,
                          letterSpacing: 3,
                          color: _navy.withValues(alpha: 0.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 28,
                        height: 1,
                        color: const Color(0xFFD4A030).withValues(alpha: 0.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ──────────────────────────────────────────
  Widget _buildMainCard({
    required int index,
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required Color accentColor,
    required Widget destination,
  }) {
    return SlideTransition(
      position: _cardSlides[index],
      child: FadeTransition(
        opacity: _cardFades[index],
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => destination),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // 左アクセントバー
                Container(
                  width: 5,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        accentColor,
                        accentColor.withValues(alpha: 0.4),
                      ],
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // アイコン
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: accentColor, size: 22),
                ),
                const SizedBox(width: 14),
                // テキスト
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: accentColor,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                              color: accentColor.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              subtitle,
                              style: TextStyle(
                                fontSize: 9.5,
                                fontWeight: FontWeight.w700,
                                color: accentColor.withValues(alpha: 0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12.5,
                          color: Colors.grey.shade500,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: accentColor.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ──────────────────────────────────────────
  Widget _buildSubCard({
    required int index,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget destination,
  }) {
    return Expanded(
      child: SlideTransition(
        position: _cardSlides[index],
        child: FadeTransition(
          opacity: _cardFades[index],
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => destination),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 14, 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.09),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Icon(icon, color: color, size: 19),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: color,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 10.5,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: 12, color: Colors.grey.shade300),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
