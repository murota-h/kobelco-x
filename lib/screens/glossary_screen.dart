import 'package:flutter/material.dart';
import '../data/glossary_data.dart';

class GlossaryScreen extends StatefulWidget {
  const GlossaryScreen({super.key});

  @override
  State<GlossaryScreen> createState() => _GlossaryScreenState();
}

class _GlossaryScreenState extends State<GlossaryScreen> {
  static const Color _navy = Color(0xFF1a3a6b);
  static const Color _bg = Color(0xFFF5F7FA);

  String _selectedCategory = 'すべて';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  List<String> get _categories {
    final cats = glossaryItems.map((e) => e.category).toSet().toList();
    cats.sort();
    return ['すべて', ...cats];
  }

  List<GlossaryItem> get _filteredItems {
    return glossaryItems.where((item) {
      final matchCat =
          _selectedCategory == 'すべて' || item.category == _selectedCategory;
      final q = _searchQuery.toLowerCase();
      final matchSearch = q.isEmpty ||
          item.term.toLowerCase().contains(q) ||
          item.reading.toLowerCase().contains(q) ||
          item.definition.toLowerCase().contains(q);
      return matchCat && matchSearch;
    }).toList();
  }

  Color _categoryColor(String category) {
    switch (category) {
      case '変革':
        return const Color(0xFF1a3a6b);
      case '戦略':
        return const Color(0xFF4a1a6b);
      case '品質':
        return const Color(0xFF1a6b3a);
      case '環境':
        return const Color(0xFF2a7a2a);
      case '製品・技術':
        return const Color(0xFF6b3a1a);
      case 'デジタル':
        return const Color(0xFF1a5a7a);
      case '人材':
        return const Color(0xFF7a3a5a);
      case 'ものづくり':
        return const Color(0xFF5a4a1a);
      default:
        return const Color(0xFF555555);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = _filteredItems;

    return Scaffold(
      backgroundColor: _bg,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130,
            pinned: true,
            automaticallyImplyLeading: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 14),
              title: const Text(
                '用語解説',
                style: TextStyle(
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
                    colors: [
                      Color(0xFF0a1c3d),
                      Color(0xFF1a3a6b),
                      Color(0xFF1e579b)
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 56),
                    child: Text(
                      'アプリ内の専門用語を解説',
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
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Column(
                children: [
                  // Search field
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (v) => setState(() => _searchQuery = v),
                      decoration: InputDecoration(
                        hintText: '用語を検索…',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14),
                        prefixIcon:
                            Icon(Icons.search, color: Colors.grey.shade400),
                        suffixIcon: _searchQuery.isNotEmpty
                            ? IconButton(
                                icon: Icon(Icons.clear,
                                    color: Colors.grey.shade400),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() => _searchQuery = '');
                                },
                              )
                            : null,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Category filter chips
                  SizedBox(
                    height: 34,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 8),
                      itemBuilder: (context, i) {
                        final cat = _categories[i];
                        final isSelected = cat == _selectedCategory;
                        return GestureDetector(
                          onTap: () =>
                              setState(() => _selectedCategory = cat),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? _navy
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? _navy
                                    : const Color(0xFFDDE6F5),
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              cat,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF555555),
                                fontSize: 12.5,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Result count
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${items.length}件',
                      style: TextStyle(
                          color: Colors.grey.shade500, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
          items.isEmpty
              ? SliverFillRemaining(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off,
                            size: 48, color: Colors.grey.shade300),
                        const SizedBox(height: 12),
                        Text(
                          '該当する用語が見つかりません',
                          style: TextStyle(
                              color: Colors.grey.shade400, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          _GlossaryCard(item: items[index], categoryColor: _categoryColor(items[index].category)),
                      childCount: items.length,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class _GlossaryCard extends StatefulWidget {
  final GlossaryItem item;
  final Color categoryColor;

  const _GlossaryCard({required this.item, required this.categoryColor});

  @override
  State<_GlossaryCard> createState() => _GlossaryCardState();
}

class _GlossaryCardState extends State<_GlossaryCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 14, 14),
              child: Row(
                children: [
                  // Category badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: widget.categoryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      widget.item.category,
                      style: TextStyle(
                        color: widget.categoryColor,
                        fontSize: 10.5,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Term
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.term,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        if (widget.item.reading.isNotEmpty &&
                            widget.item.reading != widget.item.term)
                          Text(
                            widget.item.reading,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade500,
                            ),
                          ),
                      ],
                    ),
                  ),
                  // Expand icon
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey.shade400,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            // Expanded definition
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                        height: 1,
                        color: Colors.grey.shade100,
                        thickness: 1),
                    const SizedBox(height: 12),
                    Text(
                      widget.item.definition,
                      style: const TextStyle(
                        fontSize: 13.5,
                        height: 1.75,
                        color: Color(0xFF444444),
                      ),
                    ),
                  ],
                ),
              ),
              crossFadeState: _expanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
            ),
          ],
        ),
      ),
    );
  }
}
