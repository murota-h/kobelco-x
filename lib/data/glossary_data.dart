class GlossaryItem {
  final String term;
  final String reading;
  final String category;
  final String definition;

  const GlossaryItem({
    required this.term,
    required this.reading,
    required this.category,
    required this.definition,
  });
}

final List<GlossaryItem> glossaryItems = [
  GlossaryItem(
    term: 'KOBELCO-X',
    reading: 'コベルコエックス',
    category: '戦略',
    definition:
        'コベルコグループが推進する変革戦略の総称。「X」には「変革（Transformation）」「体験（Experience）」「かけ算（×）」「交点（Cross）」の4つの意味が込められており、AX・BX・FX・CX²・EX・GX・DXの7つの変革で構成される。',
  ),
  GlossaryItem(
    term: 'AX',
    reading: 'エーエックス',
    category: '変革',
    definition:
        '「両利きの経営」を意味する変革。既存事業の深化（稼ぐ力の強化）と新規事業の探索（成長追求）を同時に進める経営手法。2030年度に売上高3兆円・経常利益2,000億円を目標に掲げる。',
  ),
  GlossaryItem(
    term: 'BX',
    reading: 'ビーエックス',
    category: '変革',
    definition:
        '「業務変革（Business transformation）」を指す。従来の業務プロセスを抜本的に見直し、生成AIやデジタルツールを活用して効率化・高度化する取り組み。他のすべての変革を支える基礎的な活動。',
  ),
  GlossaryItem(
    term: 'FX',
    reading: 'エフエックス',
    category: '変革',
    definition:
        '「ものづくり変革（Factory transformation）」を指す。KOBELCOの核であるものづくり現場の品質向上・生産性向上・安全改善をAIやデータ活用で推進する取り組み。',
  ),
  GlossaryItem(
    term: 'CX²',
    reading: 'シーエックス二乗',
    category: '変革',
    definition:
        '「お客様対応変革（Customer experience）」を指す。「²」はグループ全体のリソースを掛け合わせる意味を表す。マーケティング強化・ソリューション提案力強化・事業部間の情報共有強化の3本柱で進める。',
  ),
  GlossaryItem(
    term: 'EX',
    reading: 'イーエックス',
    category: '変革',
    definition:
        '「従業員体験向上（Employee experience）」を指す。変革を担う人材の育成・働きやすい職場づくり・D&I推進・安全で健康な職場環境の整備などを含む取り組み。',
  ),
  GlossaryItem(
    term: 'GX',
    reading: 'ジーエックス',
    category: '変革',
    definition:
        '「グリーン変革（Green transformation）」を指す。カーボンニュートラルへの挑戦として、自社製造プロセスのCO₂削減だけでなく、製品・サービスを通じて社会全体のCN実現にも貢献する取り組み。',
  ),
  GlossaryItem(
    term: 'DX',
    reading: 'ディーエックス',
    category: '変革',
    definition:
        '「デジタル変革（Digital transformation）」を指す。KOBELCO-Xにおいては、他のすべての変革をデジタル技術とデータで実現・加速・高度化する「手段」として位置づけられる。3つのSTEPで推進される。',
  ),
  GlossaryItem(
    term: 'TQM',
    reading: 'ティーキューエム',
    category: '品質',
    definition:
        '「全社的品質管理（Total Quality Management）」の略。全員参加でお客様満足を追求する経営手法。KOBELCOでは「お客様視点」「全員参加」「ひとまる変革」の3つを行動指針としている。',
  ),
  GlossaryItem(
    term: 'K-DIVE®',
    reading: 'ケーダイブ',
    category: '製品・技術',
    definition:
        '「Kobelco Dig Intelligent Via Edge」の略。コベルコ建機が開発した油圧ショベルの遠隔操作システム。通信遅延を最小化する独自技術により、離れた場所から現場と同等の精度で建設機械を操作できる。2024年能登半島地震の復旧工事でも活用された。',
  ),
  GlossaryItem(
    term: 'Koenable® Steel',
    reading: 'コエナブルスチール',
    category: '製品・技術',
    definition:
        'AI制御技術で高炉操業を最適化し、従来比でCO₂排出量を大幅に削減した低炭素高炉鉄源のブランド名。サプライチェーン全体の脱炭素を求める自動車・電機などの顧客向けに展開している。',
  ),
  GlossaryItem(
    term: 'カーボンニュートラル',
    reading: 'カーボンニュートラル',
    category: '環境',
    definition:
        '温室効果ガス（主にCO₂）の排出量と吸収量を均衡させ、実質的な排出量をゼロにすること。略称「CN」。日本政府は2050年のCN達成を目標に掲げており、KOBELCOもGXとして取り組んでいる。',
  ),
  GlossaryItem(
    term: 'アンモニア混焼',
    reading: 'アンモニアこんしょう',
    category: '環境',
    definition:
        '石炭などの化石燃料にアンモニア（NH₃）を混ぜて燃焼させる技術。アンモニアは燃焼時にCO₂を排出しないため、混焼比率を高めることでCO₂排出量を削減できる。神戸発電所で20%混焼の実証実験を推進中。',
  ),
  GlossaryItem(
    term: '両利きの経営',
    reading: 'りょうてきのけいえい',
    category: '戦略',
    definition:
        '既存事業の「深化（exploit）」と新規事業の「探索（explore）」を同時に進める経営手法。スタンフォード大学のチャールズ・オライリー教授が提唱した概念で、KOBELCOではAXとして推進している。',
  ),
  GlossaryItem(
    term: 'D&I',
    reading: 'ダイバーシティアンドインクルージョン',
    category: '人材',
    definition:
        '「ダイバーシティ（多様性）＆インクルージョン（包摂）」の略。性別・年齢・国籍・障がい・価値観など多様な人材が能力を最大限発揮できる職場環境をつくる取り組み。EXの重要な要素。',
  ),
  GlossaryItem(
    term: 'QCサークル',
    reading: 'キューシーサークル',
    category: '品質',
    definition:
        '「Quality Control Circle」の略。同じ職場の少人数のグループが自主的に品質改善活動を行う小集団活動。TQMの現場レベルの実践として、自律的な改善文化の醸成に役立てられている。',
  ),
  GlossaryItem(
    term: '生成AI',
    reading: 'せいせいエーアイ',
    category: 'デジタル',
    definition:
        '文章・画像・コードなどのコンテンツを自律的に生成できるAI技術。ChatGPTなどが代表例。KOBELCOでは汎用生成AIの全社導入と、社内特定業務向けの専用生成AIシステム構築の両面で活用を進めている。',
  ),
  GlossaryItem(
    term: 'データドリブン',
    reading: 'データドリブン',
    category: 'デジタル',
    definition:
        'データを根拠として意思決定や業務改善を行うアプローチ。経験や勘に頼る従来の手法からの転換を意味する。FXにおける品質改善やBXにおける業務効率化の基本的な考え方。',
  ),
  GlossaryItem(
    term: 'PDCAサイクル',
    reading: 'ピーディーシーエーサイクル',
    category: '品質',
    definition:
        '「Plan（計画）→ Do（実行）→ Check（評価）→ Act（改善）」を繰り返す継続的改善の手法。TQMや業務改善活動の基本フレームワークとして広く活用されている。',
  ),
  GlossaryItem(
    term: '暗黙知',
    reading: 'あんもくち',
    category: 'その他',
    definition:
        '言語化・文書化が難しい経験則や勘・コツなど、熟練者が体得している知識のこと。FXでは、熟練オペレーターの暗黙知をデータ化してAIに学習させることで、技術伝承と品質安定化を目指している。',
  ),
  GlossaryItem(
    term: 'ひとまる変革',
    reading: 'ひとまるへんかく',
    category: '品質',
    definition:
        'KOBELCO TQMの行動指針のひとつ。「ひと（人）」と「まる（丸ごと・全体）」を組み合わせた言葉で、人を中心に組織全体で変革に取り組む姿勢を表している。',
  ),
  GlossaryItem(
    term: 'スペシャリティ材料',
    reading: 'スペシャリティざいりょう',
    category: '製品・技術',
    definition:
        '汎用品と対比される高付加価値・高機能の特殊素材。自動車の軽量化材料・半導体関連材料・航空宇宙用高強度材料などが該当する。収益性が高く、競合との差別化を図りやすい分野。',
  ),
  GlossaryItem(
    term: '歩留まり',
    reading: 'ぶどまり',
    category: 'ものづくり',
    definition:
        '製造工程において、投入した原材料のうち製品として使用できる割合のこと。歩留まりが高いほど材料の無駄が少なく、コストと環境負荷の削減につながる。FXの主要な改善指標のひとつ。',
  ),
  GlossaryItem(
    term: 'ポートフォリオ',
    reading: 'ポートフォリオ',
    category: '戦略',
    definition:
        'ビジネスにおいては、企業が保有する事業・製品・投資の組み合わせ全体を指す。KOBELCOでは、素材系・機械系など多様な事業群の構成（事業ポートフォリオ）を環境変化に応じて見直している。',
  ),

  // ── TQM・財務・歴史から追加 ──
  GlossaryItem(
    term: 'ROIC',
    reading: 'アールオーアイシー',
    category: '財務',
    definition:
        '「Return on Invested Capital（投下資本利益率）」の略。企業が事業に投じた資本に対してどれだけ利益を生み出したかを示す指標。KOBELCOの2030年度目標は8%、2026年度中計目標は6%安定確保。',
  ),
  GlossaryItem(
    term: 'ROE',
    reading: 'アールオーイー',
    category: '財務',
    definition:
        '「Return on Equity（自己資本利益率）」の略。株主が出資した資本に対してどれだけ利益を上げたかを示す指標。KOBELCOは2025年3月期に10.8%を達成し、目標の8%を上回った。',
  ),
  GlossaryItem(
    term: 'D/Eレシオ',
    reading: 'ディーイーレシオ',
    category: '財務',
    definition:
        '「Debt to Equity Ratio（負債資本倍率）」の略。有利子負債を自己資本で割った値で、企業の財務健全性を示す。数値が低いほど借入への依存度が低い。KOBELCOの2026年度目標は0.7倍台半ば。',
  ),
  GlossaryItem(
    term: '信頼回復プロジェクト',
    reading: 'しんらいかいふくプロジェクト',
    category: 'TQM',
    definition:
        '2017年の品質データ不適切事案を受け、2018年4月〜2021年3月の3年間で推進した再発防止活動。社長をリーダーとし、ガバナンス・マネジメント・プロセスの3面から対策を実施した。',
  ),
  GlossaryItem(
    term: '信頼向上プロジェクト',
    reading: 'しんらいこうじょうプロジェクト',
    category: 'TQM',
    definition:
        '信頼回復プロジェクトの後継活動（2021〜2024年）。「不適切行為の風化防止」と「持続的成長」を両立させるためTQM活動を全社展開した。2024年4月に「KOBELCO TQM推進委員会」へ発展的解消。',
  ),
  GlossaryItem(
    term: '方針管理',
    reading: 'ほうしんかんり',
    category: 'TQM',
    definition:
        '経営方針や目標を全部門・全階層に展開し、PDCAサイクルで達成を管理する手法。TQMの中核的な管理手法のひとつで、各部門が会社全体の方針と自部門の課題を連動させて取り組む。',
  ),
  GlossaryItem(
    term: 'エントリー提案',
    reading: 'エントリーていあん',
    category: 'TQM',
    definition:
        'KOBELCOの素形材事業部門 銅板ユニットで導入された改善提案制度。従業員が業務改善アイデアを気軽に提案できる仕組みで、2024年度日本品質奨励賞の受賞に貢献した活動のひとつ。',
  ),
  GlossaryItem(
    term: '高炉',
    reading: 'こうろ',
    category: 'ものづくり',
    definition:
        '鉄鉱石とコークスを高温で燃焼させ、銑鉄（溶けた鉄）を生産する大型の炉。鉄鋼一貫製造の中核設備。KOBELCOは加古川・神戸の製鉄所に高炉を持ち、AIによる熱量予測システムを導入している。',
  ),
  GlossaryItem(
    term: '銑鋼一貫体制',
    reading: 'せんこういっかんたいせい',
    category: 'ものづくり',
    definition:
        '鉄鉱石から銑鉄（高炉）→鋼（転炉）→製品（圧延等）まで一貫して自社内で製造する体制。KOBELCOは1959年の灘浜地区高炉新設でこの体制を確立し、コスト競争力と品質管理力を大幅に向上させた。',
  ),
  GlossaryItem(
    term: '溶銑',
    reading: 'ようせん',
    category: 'ものづくり',
    definition:
        '高炉で鉄鉱石を溶かして得られる液体状の銑鉄のこと。ここから転炉で不純物を除去して鋼にする。FXで導入されたAI熱量予測システムは、5時間先の溶銑温度を高精度で予測して品質安定化に貢献している。',
  ),
  GlossaryItem(
    term: '銑鉄',
    reading: 'せんてつ',
    category: 'ものづくり',
    definition:
        '高炉で鉄鉱石とコークスを反応させて生産される炭素含有量の高い鉄。そのままでは脆いため、転炉で炭素を除去して「鋼（はがね）」に精製する。製鉄の中間素材。',
  ),
  GlossaryItem(
    term: '純資産比率',
    reading: 'じゅんしさんひりつ',
    category: '財務',
    definition:
        '総資産に占める純資産（自己資本）の割合。「自己資本比率」とも呼ばれる。数値が高いほど財務基盤が安定していることを示す。KOBELCOの2026年度中計目標は40%台前半。',
  ),
  GlossaryItem(
    term: 'ミドルマネジメント',
    reading: 'ミドルマネジメント',
    category: 'TQM',
    definition:
        '部長・課長などの中間管理職層のこと。経営方針を現場に落とし込み、現場の課題を経営に伝える重要な役割を担う。KOBELCO TQMの3大施策のひとつとして「ミドルマネジメント強化」が掲げられている。',
  ),
  GlossaryItem(
    term: '鈴木商店',
    reading: 'すずきしょうてん',
    category: '歴史',
    definition:
        '明治〜大正期に活躍した大商社。神戸製鋼所の創業の母体となった企業で、金子直吉が「国益を増進させる」理念のもと神戸製鋼所の経営を引き受けた。1927年に経営破綻したが、神戸製鋼所は既に独立していた。',
  ),
];

