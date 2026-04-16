import 'package:flutter/material.dart';
import '../data/history_data.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  static const Color _navy = Color(0xFF1a3a6b);
  static const Color _bg = Color(0xFFF5F7FA);

  final Set<int> _expandedEras = {0, 4}; // 最初と最後を展開

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(child: _buildStats()),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 48),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => _buildEraSection(i),
                childCount: historyEras.length,
              ),
            ),
          ),
        ],
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
                style: TextStyle(fontSize: 13.5, height: 1.75, color: Color(0xFF444444)),
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

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 160,
      pinned: true,
      automaticallyImplyLeading: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.public_outlined, color: Colors.white, size: 21),
          tooltip: '情報ソースについて',
          onPressed: () => _showDisclaimer(context),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 16, bottom: 14),
        title: const Text(
          'KOBELCOの歴史',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 19,
            letterSpacing: 1,
          ),
        ),
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF1a0a00), Color(0xFF4E342E), Color(0xFF6D4C41)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -40,
                top: -40,
                child: Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.04),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 56),
                  child: Row(
                    children: [
                      Text(
                        '1905年創業　',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.65),
                          fontSize: 12,
                          letterSpacing: 1,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '120年以上の歴史',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStats() {
    final stats = [
      ('1905年', '創業'),
      ('243社', 'グループ企業'),
      ('約39,000名', '連結従業員'),
      ('23ヶ国', '海外展開'),
    ];
    return Container(
      color: _bg,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Row(
        children: stats.asMap().entries.map((e) {
          final i = e.key;
          final s = e.value;
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(right: i < stats.length - 1 ? 8 : 0),
              padding: const EdgeInsets.symmetric(vertical: 11),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    s.$1,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: _navy,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    s.$2,
                    style: const TextStyle(
                      fontSize: 9.5,
                      color: Color(0xFF888888),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEraSection(int index) {
    final era = historyEras[index];
    final color = Color(era.colorValue);
    final isExpanded = _expandedEras.contains(index);

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          // Era header (accordion toggle)
          GestureDetector(
            onTap: () {
              setState(() {
                if (isExpanded) {
                  _expandedEras.remove(index);
                } else {
                  _expandedEras.add(index);
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 14, 14, 14),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      era.period,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          era.era,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          era.subtitle,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white.withValues(alpha: 0.8),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Events timeline (animated)
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 250),
            crossFadeState:
                isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              margin: const EdgeInsets.only(top: 2),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: era.events.asMap().entries.map((e) {
                  final i = e.key;
                  final event = e.value;
                  final isLast = i == era.events.length - 1;
                  return _buildEvent(event, color, isLast);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEvent(HistoryEvent event, Color eraColor, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline line + dot
          SizedBox(
            width: 36,
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: eraColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(color: eraColor.withValues(alpha: 0.4), width: 1.5),
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: eraColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Center(
                      child: Container(
                        width: 1.5,
                        color: eraColor.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 8 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Year + badge
                  Row(
                    children: [
                      Text(
                        '${event.year}年${event.month != null ? ' ${event.month}' : ''}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: eraColor,
                          letterSpacing: 0.3,
                        ),
                      ),
                      if (event.badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: eraColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            event.badge!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Title
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Description
                  Text(
                    event.description,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.65,
                      color: Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
