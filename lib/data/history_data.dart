class HistoryEvent {
  final int year;
  final String? month;
  final String title;
  final String description;
  final String? badge;

  const HistoryEvent({
    required this.year,
    this.month,
    required this.title,
    required this.description,
    this.badge,
  });
}

class HistoryEra {
  final String era;
  final String period;
  final String subtitle;
  final int colorValue;
  final List<HistoryEvent> events;

  const HistoryEra({
    required this.era,
    required this.period,
    required this.subtitle,
    required this.colorValue,
    required this.events,
  });
}

final List<HistoryEra> historyEras = [
  HistoryEra(
    era: '黎明期',
    period: '1905 〜 1920年代',
    subtitle: '創業と基盤づくり',
    colorValue: 0xFF6D4C41,
    events: [
      HistoryEvent(
        year: 1905,
        month: '9月1日',
        title: '神戸製鋼所 創業',
        description:
            '鈴木商店が神戸・脇浜の小林製鋼所を買収し「神戸製鋼所」と改称。鈴木商店の金子直吉が「国益を増進させる」理念のもと経営を引き受けた。',
        badge: '創業',
      ),
      HistoryEvent(
        year: 1911,
        month: '6月28日',
        title: '株式会社として独立',
        description: '鈴木商店から独立し「株式会社神戸製鋼所」として正式発足。独立した企業体として本格的な成長の道を歩み始める。',
      ),
      HistoryEvent(
        year: 1914,
        title: '国産初の空気圧縮機を開発',
        description:
            '機械事業の原点となる国産初の空気圧縮機を開発。日本が輸入に依存していた工業製品の国産化という創業理念を具現化した。',
        badge: '国産初',
      ),
      HistoryEvent(
        year: 1917,
        title: '銅事業スタート',
        description: '銅製品製造に参入。後に素材系事業の柱のひとつとなる銅板・銅条の生産基盤を確立。',
      ),
    ],
  ),
  HistoryEra(
    era: '拡大期',
    period: '1920 〜 1940年代',
    subtitle: '多角化と新事業への挑戦',
    colorValue: 0xFF4E342E,
    events: [
      HistoryEvent(
        year: 1926,
        title: 'エンジニアリング事業スタート',
        description: 'プラント建設などエンジニアリング事業に参入。ものづくりの枠を超えた総合産業企業への第一歩。',
      ),
      HistoryEvent(
        year: 1930,
        title: '国産初の電気ショベル完成',
        description:
            '国産初の電気ショベルが完成。これがコベルコ建機の起源となる建設機械事業の原点。現在グローバルに展開する建機ビジネスの礎を築いた。',
        badge: '国産初',
      ),
      HistoryEvent(
        year: 1937,
        title: 'アルミ事業スタート・株式上場',
        description:
            'アルミ鋳造・鍛造事業に参入するとともに株式を上場。多角化経営の加速と資本市場への参入を同時に実現した転換の年。',
      ),
      HistoryEvent(
        year: 1940,
        title: '溶接事業スタート',
        description: '溶接機・溶接材料の製造を開始。ものづくりの核心技術である溶接分野で独自の地位を確立していく。',
      ),
    ],
  ),
  HistoryEra(
    era: '復興・成長期',
    period: '1945 〜 1970年代',
    subtitle: '戦後復興から高度成長へ',
    colorValue: 0xFF1B5E20,
    events: [
      HistoryEvent(
        year: 1949,
        month: '5月',
        title: '東証・大証・名証 一部に上場',
        description: '東京・大阪・名古屋の証券取引所一部に株式上場。戦後復興の象徴として資本市場での信頼を獲得。',
      ),
      HistoryEvent(
        year: 1955,
        title: '国内初のチタン工業生産',
        description:
            '国内初のチタン工業生産を開始。航空宇宙・医療など先端分野に不可欠な素材で、新素材分野への先駆的参入となった。',
        badge: '国内初',
      ),
      HistoryEvent(
        year: 1959,
        month: '1月',
        title: '灘浜地区 第1高炉 火入れ',
        description:
            '神戸製鉄所灘浜地区を新設し第1高炉の火入れを実施。銑鋼一貫体制を確立しコスト削減と自家発電活用を実現。企業最大の転換点となった。',
        badge: '大転換',
      ),
      HistoryEvent(
        year: 1965,
        month: '4月',
        title: '尼崎製鉄を吸収合併',
        description: '尼崎製鉄を吸収合併し、尼崎・堺・呉の工場を取得。規模の拡大と生産体制の強化を実現。',
      ),
      HistoryEvent(
        year: 1968,
        title: '海外初の生産工場 タイに設立',
        description:
            'タイに「タイ神戸ウェルディング社（TKW社）」を設立。神戸製鋼全社初の海外生産工場として本格的なグローバル展開の第一歩を踏み出した。',
        badge: '海外初',
      ),
    ],
  ),
  HistoryEra(
    era: 'グローバル展開期',
    period: '1979 〜 2000年代',
    subtitle: 'KOBELCOブランドと世界展開',
    colorValue: 0xFF0D47A1,
    events: [
      HistoryEvent(
        year: 1979,
        month: '9月',
        title: '「KOBELCO」ブランド制定',
        description:
            '「KOBE」と「ELectric」に由来する「KOBELCO」を国際統一営業標識として制定。グローバル展開に伴う統一ブランドの必要性から誕生した。',
        badge: 'ブランド誕生',
      ),
      HistoryEvent(
        year: 1995,
        title: '阪神・淡路大震災 高炉を2.5ヶ月で再稼働',
        description:
            '阪神・淡路大震災により神戸製鉄所の高炉が損傷する甚大な被害。しかしわずか2ヶ月半で高炉を再稼働させ、神戸の震災復興のシンボルとなった。',
        badge: '復活',
      ),
      HistoryEvent(
        year: 2001,
        month: '10月',
        title: 'コベルコ建機 設立',
        description:
            '建設機械カンパニー・油谷重工・神鋼コベルコ建機の3社を統合し「コベルコ建機」を設立。建機事業を独立した事業体として強化する体制を確立。',
      ),
      HistoryEvent(
        year: 2002,
        title: '電力事業スタート',
        description: '製鉄業で培った自家発電ノウハウを活かし電力供給事業を開始。神戸市・阪神地区の安定電力供給に貢献。',
      ),
      HistoryEvent(
        year: 2006,
        month: '4月',
        title: '「KOBELCO」をグループブランドとして制定',
        description:
            'グループの複数事業を束ねる統一ブランドとして「KOBELCO」を新たに制定。ステークホルダーからの認知と信頼向上を目的にグループ一体感を醸成。',
      ),
    ],
  ),
  HistoryEra(
    era: '変革・再生期',
    period: '2017年 〜 現在',
    subtitle: '品質問題を乗り越え、新たな変革へ',
    colorValue: 0xFF1A237E,
    events: [
      HistoryEvent(
        year: 2017,
        month: '10月',
        title: '品質データ不適切事案が発覚',
        description:
            'アルミ・銅製品の検査データ改ざんが発覚。供給先はトヨタ・三菱重工など約200社。これを契機に品質を最優先とする企業文化の根本的な見直しが始まった。',
        badge: '転換点',
      ),
      HistoryEvent(
        year: 2018,
        month: '4月',
        title: '信頼回復プロジェクト 始動',
        description:
            '社長をリーダーとする「信頼回復プロジェクト」を発足。ガバナンス・マネジメント・プロセスの3面から再発防止策を3年計画で推進。',
      ),
      HistoryEvent(
        year: 2020,
        title: 'TQM活動 本格始動',
        description:
            '信頼回復から信頼向上へ。全員参加の「KOBELCO TQM」が本格始動。QCサークル活動の全社展開と品質文化の醸成を推進。',
        badge: 'TQM開始',
      ),
      HistoryEvent(
        year: 2023,
        title: '水素燃料電池ショベル 試作機完成',
        description:
            'コベルコ建機と共同で水素燃料電池を搭載したショベルの試作機が完成。建機業界における脱炭素化のパイオニアとして注目を集めた。',
        badge: 'GX',
      ),
      HistoryEvent(
        year: 2024,
        title: 'KOBELCO-X 変革戦略 本格展開',
        description:
            'AX・BX・FX・CX²・EX・GX・DXの7つの変革を束ねる「KOBELCO-X」戦略を本格展開。2030年度に売上高3兆円・経常利益2,000億円を目指す。',
        badge: 'KOBELCO-X',
      ),
      HistoryEvent(
        year: 2024,
        month: '11月',
        title: '2024年度 日本品質奨励賞 受賞',
        description:
            '素形材事業部門 銅板ユニットが「2024年度日本品質奨励賞（TQM奨励賞）」を受賞。TQM活動の成果が外部から高く評価された。',
        badge: '受賞',
      ),
    ],
  ),
];
