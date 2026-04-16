import 'package:flutter/material.dart';

class TqmScreen extends StatelessWidget {
  const TqmScreen({super.key});

  static const Color _navy = Color(0xFF1a3a6b);
  static const Color _bg = Color(0xFFF5F7FA);
  static const Color _gold = Color(0xFFB8860B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 48),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // ── KPI サマリ ──
                _buildKpiRow(),
                const SizedBox(height: 20),

                // ── TQMとは ──
                _sectionHeader('TQMとは', Icons.info_outline),
                const SizedBox(height: 10),
                _definitionCard(),
                const SizedBox(height: 20),

                // ── 取り組みの歴史 ──
                _sectionHeader('取り組みの歴史', Icons.timeline),
                const SizedBox(height: 10),
                _timelineCard(),
                const SizedBox(height: 20),

                // ── 3つの行動指針 ──
                _sectionHeader('3つの行動指針', Icons.flag_outlined),
                const SizedBox(height: 10),
                _principlesCard(),
                const SizedBox(height: 20),

                // ── 推進体制 ──
                _sectionHeader('推進体制', Icons.account_tree_outlined),
                const SizedBox(height: 10),
                _organizationCard(),
                const SizedBox(height: 20),

                // ── 3大施策 ──
                _sectionHeader('3大施策', Icons.checklist_outlined),
                const SizedBox(height: 10),
                _measuresCard(),
                const SizedBox(height: 20),

                // ── 2030年度目標 vs 実績 ──
                _sectionHeader('2030年度 数値目標 vs 実績', Icons.bar_chart),
                const SizedBox(height: 10),
                _kpiProgressCard(),
                const SizedBox(height: 20),

                // ── 中期経営計画 ──
                _sectionHeader('中期経営計画（2024〜2026年度）', Icons.calendar_today_outlined),
                const SizedBox(height: 10),
                _midtermPlanCard(),
                const SizedBox(height: 20),

                // ── 受賞実績 ──
                _sectionHeader('受賞実績', Icons.emoji_events_outlined),
                const SizedBox(height: 10),
                _awardCard(),
                const SizedBox(height: 20),

                // ── 品質憲章 ──
                _sectionHeader('品質憲章', Icons.gavel_outlined),
                const SizedBox(height: 10),
                _charterCard(),
                const SizedBox(height: 20),

                // ── KOBELCO-Xとのつながり ──
                _sectionHeader('KOBELCO-X との連携', Icons.hub_outlined),
                const SizedBox(height: 10),
                _connectionCard(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────────────────────
  Widget _buildAppBar(BuildContext context) {
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
          'KOBELCO TQM',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 19,
            letterSpacing: 1.5,
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
          child: Stack(
            children: [
              Positioned(
                right: -30,
                top: -30,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.04),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Container(
                  width: 120,
                  height: 120,
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
                        'Total Quality Management　',
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
                          '2020年〜 全社展開',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.85),
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

  // ───────────────────────────────────────
  Widget _sectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 18, color: _navy),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: _navy,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  // ───────────────────────────────────────
  Widget _buildKpiRow() {
    return Row(
      children: [
        _kpiChip(
          label: '2030年度\n売上高目標',
          value: '3兆円',
          icon: Icons.trending_up,
          color: _navy,
        ),
        const SizedBox(width: 10),
        _kpiChip(
          label: '2030年度\n経常利益目標',
          value: '2,000億円',
          icon: Icons.monetization_on_outlined,
          color: const Color(0xFF1a6b3a),
        ),
        const SizedBox(width: 10),
        _kpiChip(
          label: '2030年度\nROIC目標',
          value: '8%',
          icon: Icons.donut_large_outlined,
          color: const Color(0xFF6b3a1a),
        ),
      ],
    );
  }

  Widget _kpiChip({
    required String label,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white.withValues(alpha: 0.7), size: 18),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.75),
                fontSize: 10.5,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ───────────────────────────────────────
  Widget _definitionCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF3FB),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.school_outlined, color: _navy, size: 24),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Text(
                  'Total Quality Management（TQM）は、品質向上を製造現場だけでなく全部門・全階層で推進する経営手法です。KOBELCOでは「各事業のマネジメント強化と課題達成を全員参加で推進する活動」と定義しています。',
                  style: TextStyle(fontSize: 14, height: 1.8, color: Color(0xFF444444)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8E1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFFFCC80)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.lightbulb_outline, color: Color(0xFFE65100), size: 18),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'KOBELCOのTQMは2020年度から本格始動。社長をリーダーとする「信頼向上プロジェクト」として全社展開され、2024年4月からは「KOBELCO TQM推進委員会」へと発展・継承されています。',
                    style: TextStyle(fontSize: 13, height: 1.7, color: Color(0xFF5D4037)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────────────────────
  Widget _timelineCard() {
    return _card(
      child: Column(
        children: [
          _timelineItem(
            phase: 'Phase 1',
            period: '2018年4月 〜 2021年3月',
            title: '信頼回復プロジェクト',
            description:
                '2017年10月の品質不適切事案を受け、ガバナンス・マネジメント・プロセスの3面から再発防止策を3年間で完遂。社長をリーダーとする推進体制を構築。',
            color: const Color(0xFF7B1FA2),
            isFirst: true,
            isLast: false,
          ),
          _timelineItem(
            phase: 'Phase 2',
            period: '2021年4月 〜 2024年3月',
            title: '信頼向上プロジェクト',
            description:
                'TQM活動を2020年度から本格始動。「不適切行為の風化防止」と「持続的成長」の両立を目指し、全社的な品質文化の醸成・QCサークル活動の拡大を推進。',
            color: const Color(0xFF1565C0),
            isFirst: false,
            isLast: false,
          ),
          _timelineItem(
            phase: 'Phase 3',
            period: '2024年4月 〜 現在',
            title: 'KOBELCO TQM推進委員会',
            description:
                '信頼向上プロジェクトを発展的解消し、経営審議会の補佐機関として「KOBELCO TQM推進委員会」（委員12名）を設置。グループ全体へのTQM浸透と収益基盤強化を推進。',
            color: _navy,
            isFirst: false,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _timelineItem({
    required String phase,
    required String period,
    required String title,
    required String description,
    required Color color,
    required bool isFirst,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left: dot & line
          SizedBox(
            width: 40,
            child: Column(
              children: [
                if (!isFirst)
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(width: 2, color: const Color(0xFFDDE6F5)),
                    ),
                  ),
                Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: color.withValues(alpha: 0.4),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    flex: 8,
                    child: Center(
                      child: Container(width: 2, color: const Color(0xFFDDE6F5)),
                    ),
                  ),
              ],
            ),
          ),
          // Right: content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 12,
                bottom: isLast ? 0 : 20,
                top: isFirst ? 0 : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          phase,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        period,
                        style: TextStyle(
                          fontSize: 11.5,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.65,
                      color: Color(0xFF555555),
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

  // ───────────────────────────────────────
  Widget _principlesCard() {
    final principles = [
      (
        '01',
        'お客様視点',
        'お客様・社会にとって「なくてはならない存在」を目指す',
        Icons.people_outline,
        const Color(0xFF1565C0),
      ),
      (
        '02',
        '全員参加',
        '全部門・全階層が一体となって品質改善に取り組む',
        Icons.groups_outlined,
        const Color(0xFF2E7D32),
      ),
      (
        '03',
        'ひとまる変革',
        'PDCAを回し続け、継続的に改善・革新を推進する',
        Icons.autorenew,
        _navy,
      ),
    ];

    return _card(
      child: Column(
        children: principles.asMap().entries.map((e) {
          final i = e.key;
          final p = e.value;
          return Column(
            children: [
              if (i > 0) const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      p.$5.withValues(alpha: 0.08),
                      p.$5.withValues(alpha: 0.03),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: p.$5.withValues(alpha: 0.2)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: p.$5,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Icon(p.$4, color: Colors.white, size: 22),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                p.$1,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  color: p.$5.withValues(alpha: 0.5),
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                p.$2,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: p.$5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            p.$3,
                            style: const TextStyle(
                              fontSize: 12.5,
                              height: 1.55,
                              color: Color(0xFF555555),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  // ───────────────────────────────────────
  Widget _organizationCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 外部品質監督委員会
          _orgBox(
            label: '外部モニタリング',
            title: '品質マネジメント委員会',
            detail: '社外有識者 3名 ＋ 社内役員 2名 ／ 2019年4月設置\nTQM推進委員会をモニタリングし取締役会に報告',
            color: const Color(0xFF5D4037),
            icon: Icons.remove_red_eye_outlined,
          ),
          _orgArrow(),
          // 経営審議会
          _orgBox(
            label: '意思決定機関',
            title: '経営審議会',
            detail: 'TQM推進委員会の上位機関として位置づけ',
            color: const Color(0xFF37474F),
            icon: Icons.business_outlined,
          ),
          _orgArrow(),
          // KOBELCO TQM推進委員会
          _orgBox(
            label: '中核推進組織 ／ 2024年4月設置',
            title: 'KOBELCO TQM推進委員会',
            detail: '委員 12名（本社及び事業部門）\n委員長：全社TQM活動推進の総括役員\n経営審議会の補佐機関として機能',
            color: _navy,
            icon: Icons.account_balance_outlined,
            isMain: true,
          ),
          _orgArrow(),
          // 3施策
          Row(
            children: [
              Expanded(
                child: _orgBox(
                  label: '',
                  title: 'ミドル\nマネジメント\n強化',
                  detail: '',
                  color: const Color(0xFF1565C0),
                  icon: Icons.manage_accounts_outlined,
                  small: true,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _orgBox(
                  label: '',
                  title: '品質保証\n強化',
                  detail: '',
                  color: const Color(0xFF2E7D32),
                  icon: Icons.verified_outlined,
                  small: true,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _orgBox(
                  label: '',
                  title: 'QCサークル\n活動等',
                  detail: '',
                  color: const Color(0xFF6A1B9A),
                  icon: Icons.group_work_outlined,
                  small: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _orgBox({
    required String label,
    required String title,
    required String detail,
    required Color color,
    required IconData icon,
    bool isMain = false,
    bool small = false,
  }) {
    if (small) {
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: color,
                height: 1.4,
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isMain ? color : color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: isMain ? color : color.withValues(alpha: 0.25),
          width: isMain ? 0 : 1,
        ),
        boxShadow: isMain
            ? [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: isMain ? Colors.white : color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label.isNotEmpty)
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 10,
                      color: isMain
                          ? Colors.white.withValues(alpha: 0.65)
                          : color.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: isMain ? Colors.white : color,
                  ),
                ),
                if (detail.isNotEmpty) ...[
                  const SizedBox(height: 3),
                  Text(
                    detail,
                    style: TextStyle(
                      fontSize: 11.5,
                      height: 1.55,
                      color: isMain
                          ? Colors.white.withValues(alpha: 0.75)
                          : const Color(0xFF666666),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _orgArrow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Center(
        child: Icon(Icons.arrow_downward, color: Colors.grey.shade300, size: 18),
      ),
    );
  }

  // ───────────────────────────────────────
  Widget _measuresCard() {
    final measures = [
      (
        'ミドルマネジメント強化',
        '部課長層のマネジメントスキル向上を支援。リーダーシップ研修・方針管理の徹底により、中間管理職が変革を牽引できる体制を構築。',
        Icons.manage_accounts_outlined,
        const Color(0xFF1565C0),
      ),
      (
        '品質保証強化',
        '品質憲章に基づき、全事業・全工程で「品質最優先」の意識を徹底。顧客仕様・公的規格の遵守と品質検査プロセスの高度化を推進。',
        Icons.verified_outlined,
        const Color(0xFF2E7D32),
      ),
      (
        'QCサークル活動等の業務品質改善',
        '5〜10名の小集団が自ら課題を設定し、データに基づいて改善を実施。「ひとまる変革」の現場実践の場として全グループに展開中。',
        Icons.group_work_outlined,
        const Color(0xFF6A1B9A),
      ),
    ];

    return _card(
      child: Column(
        children: measures.asMap().entries.map((e) {
          final i = e.key;
          final m = e.value;
          return Column(
            children: [
              if (i > 0) ...[
                const SizedBox(height: 4),
                Divider(color: Colors.grey.shade100),
                const SizedBox(height: 4),
              ],
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: m.$4.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Icon(m.$3, color: m.$4, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          m.$1,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: m.$4,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          m.$2,
                          style: const TextStyle(
                            fontSize: 13,
                            height: 1.65,
                            color: Color(0xFF555555),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  // ───────────────────────────────────────
  Widget _kpiProgressCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 凡例
          Row(
            children: [
              _legend('2025年3月期（実績）', const Color(0xFF1a3a6b)),
              const SizedBox(width: 16),
              _legend('2030年度（目標）', const Color(0xFFDDE6F5)),
            ],
          ),
          const SizedBox(height: 20),

          // 売上高
          _kpiBar(
            label: '売上高',
            actualLabel: '2兆5,550億円',
            targetLabel: '3兆円',
            progress: 2.555 / 3.0,
            color: _navy,
          ),
          const SizedBox(height: 18),

          // 経常損益
          _kpiBar(
            label: '経常損益',
            actualLabel: '1,571億円',
            targetLabel: '2,000億円',
            progress: 1571 / 2000,
            color: const Color(0xFF1a6b3a),
          ),
          const SizedBox(height: 18),

          // ROIC
          _kpiBar(
            label: 'ROIC',
            actualLabel: '6.9%',
            targetLabel: '8.0%',
            progress: 6.9 / 8.0,
            color: const Color(0xFF6b3a1a),
          ),
          const SizedBox(height: 18),

          // ROE
          _kpiBar(
            label: 'ROE',
            actualLabel: '10.8%',
            targetLabel: '8.0%以上',
            progress: 1.0, // ROEは目標超過
            color: const Color(0xFF1565C0),
            overAchieved: true,
          ),
          const SizedBox(height: 16),

          // 注釈
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFDDE6F5)),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, size: 14, color: Colors.grey.shade500),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'ROEは目標（8%以上）を達成済み。売上高・経常損益・ROICは2030年度に向け進捗中。',
                    style: TextStyle(fontSize: 11.5, color: Color(0xFF777777), height: 1.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _legend(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF666666))),
      ],
    );
  }

  Widget _kpiBar({
    required String label,
    required String actualLabel,
    required String targetLabel,
    required double progress,
    required Color color,
    bool overAchieved = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF333333),
              ),
            ),
            Row(
              children: [
                Text(
                  actualLabel,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
                Text(
                  '  /  $targetLabel',
                  style: const TextStyle(fontSize: 12, color: Color(0xFFAAAAAA)),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 7),
        Stack(
          children: [
            Container(
              height: 10,
              decoration: BoxDecoration(
                color: const Color(0xFFEEF3FB),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            FractionallySizedBox(
              widthFactor: progress.clamp(0.0, 1.0),
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color, color.withValues(alpha: 0.7)],
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            overAchieved
                ? '✓ 目標達成済み'
                : '${(progress * 100).toStringAsFixed(1)}% 達成',
            style: TextStyle(
              fontSize: 11,
              color: overAchieved ? const Color(0xFF2E7D32) : Colors.grey.shade500,
              fontWeight: overAchieved ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  // ───────────────────────────────────────
  Widget _midtermPlanCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF3FB),
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Text(
              '対象期間：2024〜2026年度',
              style: TextStyle(color: _navy, fontWeight: FontWeight.w700, fontSize: 12),
            ),
          ),
          const SizedBox(height: 16),
          _planRow('ROIC（全社）', '6% 安定確保、好環境下で 8% 到達'),
          _planRow('純資産比率', '40% 台前半'),
          _planRow('グロス D/E レシオ', '0.7 倍台半ば'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(height: 1),
          ),
          const Text(
            '事業別 ROIC 目標（2026年度）',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Color(0xFF333333)),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _segmentCard('素材系事業', '6〜8%', const Color(0xFF1a3a6b)),
              const SizedBox(width: 8),
              _segmentCard('機械系事業', '8〜10%', const Color(0xFF1a6b3a)),
              const SizedBox(width: 8),
              _segmentCard('電力事業', '10%以上', const Color(0xFF6b3a1a)),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F0FF),
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: const Color(0xFFD0C8FF)),
            ),
            child: Row(
              children: [
                const Icon(Icons.computer_outlined, color: Color(0xFF5E35B1), size: 18),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'DX投資：3年間で 約600億円 を計画',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF5E35B1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _planRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6, right: 10),
            decoration: const BoxDecoration(color: _navy, shape: BoxShape.circle),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFF777777),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _segmentCard(String label, String roic, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Column(
          children: [
            Text(
              roic,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 10.5, color: Color(0xFF666666), height: 1.3),
            ),
          ],
        ),
      ),
    );
  }

  // ───────────────────────────────────────
  Widget _awardCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6D4C00), Color(0xFFB8860B), Color(0xFF9A7200)],
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: _gold.withValues(alpha: 0.35),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.emoji_events, color: Colors.white, size: 28),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2024年度 日本品質奨励賞',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        'TQM奨励賞',
                        style: TextStyle(
                          color: Color(0xFFFFE082),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _awardDetail('受賞組織', '素形材事業部門 銅板ユニット（山口県下関市）'),
                  const SizedBox(height: 8),
                  _awardDetail('TQM開始', '2021年度より取り組み開始'),
                  const SizedBox(height: 8),
                  _awardDetail('評価ポイント',
                      '損益分岐点の改善・顧客満足度の向上を「厳しい経営環境の中」で達成'),
                  const SizedBox(height: 8),
                  _awardDetail('授賞式', '2024年11月13日（経団連会館）'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'ユニット長のリーダーシップによる全従業員の品質意識向上、方針管理に基づく改善活動の展開、「エントリー提案」と呼ばれる改善提案制度の導入が高く評価されました。',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  height: 1.65,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _awardDetail(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label：',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.65),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12.5,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  // ───────────────────────────────────────
  Widget _charterCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.gavel, color: _navy, size: 20),
              const SizedBox(width: 10),
              const Text(
                '品質憲章',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: _navy),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF3FB),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  '2017年10月 制定',
                  style: TextStyle(color: _navy, fontSize: 10.5, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFDDE6F5)),
            ),
            child: const Text(
              '「法令、公的規格ならびにお客様と取り決めた仕様を遵守し、品質向上に向けてたゆまぬ努力を続ける」',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                height: 1.75,
                color: Color(0xFF333333),
              ),
            ),
          ),
          const SizedBox(height: 14),
          _charterPrinciple(
            Icons.star_border,
            '品質最優先',
            '「決して納期やコストが品質に優先するものではなく、品質を最優先する」と明言',
            const Color(0xFF1565C0),
          ),
          const SizedBox(height: 10),
          _charterPrinciple(
            Icons.shield_outlined,
            '安全・健康が第一前提',
            '安全・健康、環境・防災への対応が最優先事項として位置づけられている',
            const Color(0xFF2E7D32),
          ),
        ],
      ),
    );
  }

  Widget _charterPrinciple(IconData icon, String title, String desc, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 17),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: color),
              ),
              const SizedBox(height: 3),
              Text(
                desc,
                style: const TextStyle(fontSize: 12.5, height: 1.55, color: Color(0xFF666666)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ───────────────────────────────────────
  Widget _connectionCard() {
    final connections = [
      ('TQM 品質向上・継続改善', ['BX', 'FX'], const Color(0xFF1565C0)),
      ('TQM 全員参加・人材育成', ['EX'], const Color(0xFF2E7D32)),
      ('TQM 改善活動のデジタル加速', ['DX'], _navy),
      ('TQM お客様視点の徹底', ['CX²'], const Color(0xFF72243E)),
    ];

    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TQMの活動内容はKOBELCO-Xの各変革と深く連携しており、相互に強化し合います。',
            style: TextStyle(fontSize: 13.5, height: 1.7, color: Color(0xFF555555)),
          ),
          const SizedBox(height: 16),
          ...connections.map((c) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                        decoration: BoxDecoration(
                          color: c.$3.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: c.$3.withValues(alpha: 0.2)),
                        ),
                        child: Text(
                          c.$1,
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: c.$3,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.arrow_forward, size: 15, color: Colors.grey.shade400),
                    ),
                    Row(
                      children: c.$2.map((label) => Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                        decoration: BoxDecoration(
                          color: c.$3,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )).toList(),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  // ───────────────────────────────────────
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

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.055),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
