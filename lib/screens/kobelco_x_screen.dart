import 'package:flutter/material.dart';
import '../data/x_data.dart';
import 'kobelco_x_detail_screen.dart';

class KobelcoXScreen extends StatelessWidget {
  const KobelcoXScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130,
            pinned: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.public, color: Colors.white, size: 22),
                tooltip: '情報ソースについて',
                onPressed: () => _showDisclaimer(context),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 14),
              title: const Text(
                'KOBELCO-X',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  letterSpacing: 2,
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
                      '神戸製鋼所　変革学習ガイド',
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
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildRow(context, xCards[0], xCards[1]),
                const SizedBox(height: 12),
                _buildRow(context, xCards[2], xCards[3]),
                const SizedBox(height: 12),
                _buildRow(context, xCards[4], xCards[5]),
                const SizedBox(height: 12),
                _buildDxCard(context, xCards[6]),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(BuildContext context, XCardData left, XCardData right) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: _buildCard(context, left)),
          const SizedBox(width: 12),
          Expanded(child: _buildCard(context, right)),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, XCardData card) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => KobelcoXDetailScreen(card: card)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [card.color, card.accentColor],
          ),
          boxShadow: [
            BoxShadow(
              color: card.color.withValues(alpha: 0.38),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.22),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    card.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  card.icon,
                  color: Colors.white.withValues(alpha: 0.30),
                  size: 26,
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              card.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              card.subtitle,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.78),
                fontSize: 11.5,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white.withValues(alpha: 0.8),
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDxCard(BuildContext context, XCardData card) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => KobelcoXDetailScreen(card: card)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [card.color, card.accentColor],
          ),
          boxShadow: [
            BoxShadow(
              color: card.color.withValues(alpha: 0.40),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.22),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      card.label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    card.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    card.subtitle,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.78),
                      fontSize: 12,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                Icon(
                  card.icon,
                  color: Colors.white.withValues(alpha: 0.55),
                  size: 44,
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white.withValues(alpha: 0.8),
                    size: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void _showDisclaimer(BuildContext context) {
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
                  const Text(
                    'PUBLIC INFORMATION ONLY',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1a3a6b),
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                '本コンテンツに含まれるすべての情報は、神戸製鋼所の公式ウェブサイト・プレスリリース・IR資料等の一般公開情報のみを出典としています。機密情報および社外秘情報は一切含まれておりません。',
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
                  child: const Text('閉じる',
                      style: TextStyle(
                          color: Color(0xFF1a3a6b), fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
