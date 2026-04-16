import 'package:flutter/material.dart';

class ExampleData {
  final String title;
  final String detail;

  const ExampleData({required this.title, required this.detail});
}

class XCardData {
  final String key;
  final String label;
  final String title;
  final String subtitle;
  final Color color;
  final Color accentColor;
  final String description;
  final List<ExampleData> examples;
  final IconData icon;
  final bool isFullWidth;

  const XCardData({
    required this.key,
    required this.label,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.accentColor,
    required this.description,
    required this.examples,
    required this.icon,
    this.isFullWidth = false,
  });
}

final List<XCardData> xCards = [
  XCardData(
    key: 'AX',
    label: 'AX',
    title: '両利きの経営',
    subtitle: '稼ぐ力の強化と成長追求',
    color: const Color(0xFF1a4a8b),
    accentColor: const Color(0xFF2e6ac0),
    icon: Icons.balance,
    description:
        '「稼ぐ力の強化」と「成長追求」を両立させる経営です。既存事業の深化と新規事業の探索を同時に進め、2030年度売上高3兆円・経常利益2,000億円を目指します。',
    examples: [
      ExampleData(
        title: '素材系事業：事業基盤の強化',
        detail:
            '高炉・電炉・アルミ等の各素材事業において、需要構造の変化や環境規制の強化を見据えた事業ポートフォリオの見直しを実施。既存設備の高効率化とともに、成長が見込まれる分野への積極的な投資を推進しています。\n\nまた、国内外のパートナーとの連携による生産コストの最適化と、スペシャリティ材料分野での高付加価値化も並行して進めています。',
      ),
      ExampleData(
        title: '機械系事業：グローバル体制の最適化',
        detail:
            '建設機械・産業機械・エンジニアリング等の機械系事業で、グローバル需要に対応した最適な生産・販売・サービス体制を構築しています。\n\nアジア・北米・欧州の各市場における現地生産拡大とサービス拠点の充実を進め、新興市場での成長機会を取り込みながら、高付加価値機種へのシフトを加速します。',
      ),
      ExampleData(
        title: '環境貢献製品による新規事業創出',
        detail:
            '脱炭素・循環型社会の実現に向け、低CO₂素材・水素関連製品・環境適合型機械など新規分野での事業創出に積極的に取り組んでいます。\n\n社会課題の解決と事業成長を一致させる「AX型経営」の具体的な実践として、国や自治体・民間企業との共創による新たなビジネスモデルの開発も推進中です。',
      ),
    ],
  ),
  XCardData(
    key: 'GX',
    label: 'GX',
    title: 'グリーン変革',
    subtitle: 'カーボンニュートラルへの挑戦',
    color: const Color(0xFF1a6b3a),
    accentColor: const Color(0xFF28a05a),
    icon: Icons.eco,
    description:
        'カーボンニュートラルへの挑戦です。自社製造プロセスのCO₂削減だけでなく、技術・製品・サービスを通じて社会全体のCN実現にも貢献します。',
    examples: [
      ExampleData(
        title: 'Koenable® Steel：低CO₂高炉鉄源の開発',
        detail:
            'AI制御技術を活用して高炉操業を最適化し、従来比でCO₂排出量を大幅に削減した低炭素高炉鉄源「Koenable® Steel」を開発・商品化しています。\n\n自動車・電機など幅広い製造業の顧客がサプライチェーン全体の脱炭素を求める中、素材段階からのCO₂削減を実現するソリューションとして国内外で展開中です。',
      ),
      ExampleData(
        title: '神戸発電所：アンモニア20%混焼への取り組み',
        detail:
            '燃焼時にCO₂を排出しないアンモニアを石炭と20%混焼する実証実験を神戸発電所で推進中です。\n\n混焼率の引き上げに伴う燃焼安定化・NOx低減などの技術課題を順次解決しながら、将来的な全量アンモニア燃焼に向けたロードマップを策定。電力分野の脱炭素に貢献します。',
      ),
      ExampleData(
        title: 'ハイブリッド水素ガス供給システム',
        detail:
            '水素と都市ガス（天然ガス）を組み合わせたハイブリッドガス供給システムを開発し、脱炭素新規ビジネスとして展開しています。\n\n既存のガスインフラを最大限に活用しながら段階的に水素比率を高める「移行戦略」を取ることで、コストを抑えつつ確実に脱炭素化を進めるアプローチが特徴です。',
      ),
    ],
  ),
  XCardData(
    key: 'BX',
    label: 'BX',
    title: '業務変革',
    subtitle: '仕事のやり方を変える',
    color: const Color(0xFF3C3489),
    accentColor: const Color(0xFF5852c8),
    icon: Icons.sync_alt,
    description:
        '従来の業務プロセスを抜本的に見直し変革です。単なる効率化にとどまらず、事業活動のあらゆる側面を変革します。他の全ての変革につながる基礎的な活動です。',
    examples: [
      ExampleData(
        title: '汎用生成AIの全社導入による業務効率化',
        detail:
            'ChatGPTなどの汎用生成AIを業務に組み込み、資料作成・情報収集・議事録作成・メール文案生成などを効率化しています。\n\n全社員が安全に活用できるセキュアな環境を整備し、活用研修と並行して展開することで業務工数の大幅削減と品質向上を同時に実現。「AIを使って当たり前」の文化醸成を目指しています。',
      ),
      ExampleData(
        title: '社内特定業務への専用生成AIシステム構築',
        detail:
            '安全報告書の作成支援・品質検査記録の分析・設備異常の早期検知など、専門性の高い業務に特化した生成AIシステムを社内で独自開発しています。\n\n汎用AIと異なり、社内固有のルールや用語を学習させた専用モデルにより、精度と安全性を高レベルで両立。誤情報リスクを最小化しながら高度な業務自動化を実現します。',
      ),
      ExampleData(
        title: '承認フロー・報告業務のデジタル化',
        detail:
            '従来の紙・ハンコベースの承認プロセスをデジタル化し、承認状況のリアルタイム可視化・リモート承認・ペーパーレス化を実現しています。\n\nワークフローシステムの導入により、決裁リードタイムが大幅短縮。また報告業務のテンプレート化・自動集計により管理部門の負荷を軽減し、本来の付加価値業務へのリソース集中を可能にしています。',
      ),
    ],
  ),
  XCardData(
    key: 'FX',
    label: 'FX',
    title: 'ものづくり変革',
    subtitle: '品質・生産性・安全を高める',
    color: const Color(0xFF633806),
    accentColor: const Color(0xFF8a5010),
    icon: Icons.factory,
    description:
        'KOBELCOの核である「ものづくり現場」の変革です。品質向上・歩留・生産性向上・新技術の安定量産化を追求するとともに、作業環境・安全性の改善にも取り組みます。',
    examples: [
      ExampleData(
        title: '加古川製鉄所：AI熱量予測システムの運用開始',
        detail:
            '加古川製鉄所第2高炉に導入したAIシステムは、過去数年分の操業データと現在の炉内状況をリアルタイムで分析し、5時間先の溶銑温度を高精度で予測します。\n\n熱量の過不足を事前に把握して制御介入することで、品質の安定化と燃料コストの削減を同時に実現。熟練オペレーターの判断を支援するシステムとして高い評価を得ています。',
      ),
      ExampleData(
        title: '「AI制御」構想：高度な最適制御の開発推進',
        detail:
            'データ収集・可視化にとどまらず、AIが最適な操業パラメータを自律的に算出・制御する「AI制御炉」の実現を目指した開発プロジェクトです。\n\n熟練オペレーターの暗黙知をデータ化してAIに学習させ、誰でも高品質な操業が実現できる仕組みを構築します。人手不足対応と技術伝承の両課題を同時に解決するアプローチです。',
      ),
      ExampleData(
        title: '製造現場のデジタル化：品質データの可視化',
        detail:
            '製造現場の品質データをリアルタイムでダッシュボード化し、品質状態の見える化・異常の早期発見・トレンド分析を実現しています。\n\n従来は経験と勘に頼っていた品質判断をデータドリブンに転換することで、部門間での情報共有が容易になり、品質改善のPDCAサイクルが大幅に加速。工場全体の品質底上げにつながっています。',
      ),
    ],
  ),
  XCardData(
    key: 'CX',
    label: 'CX²',
    title: 'お客様対応変革',
    subtitle: '提案力・マーケティング強化',
    color: const Color(0xFF72243E),
    accentColor: const Color(0xFFa83560),
    icon: Icons.handshake,
    description:
        'グループ全体のリソースを活かして、お客様への提案力を高める変革です。マーケティング力強化・ソリューション提案力強化・事業部間の情報共有強化の3本柱です。',
    examples: [
      ExampleData(
        title: 'K-DIVE®：建機の遠隔操作システム',
        detail:
            'K-DIVE®（Kobelco Dig Intelligent Via Edge）は、コベルコ建機が独自開発した油圧ショベルの遠隔操作システムです。\n\n通信遅延を最小化する独自技術により、離れた場所から現場と同等の精度での掘削作業が可能。オペレーターが安全な室内から建設機械を操作できることで、危険現場への人員投入リスクをゼロにします。また稼働データをクラウドで収集・分析し、生産性向上や予防保全にも活用しています。',
      ),
      ExampleData(
        title: '輪島崩島地区の復旧工事でK-DIVE®を活用',
        detail:
            '2024年能登半島地震で甚大な被害を受けた輪島市崩島地区の復旧・復興工事に、K-DIVE®が投入されました。\n\n土砂崩落により作業員の立ち入りが困難な危険区域において、安全な場所から遠隔操作で瓦礫の除去・地形整備作業を実施。人命を守りながら工期を確保するという社会的使命を最新技術で果たし、災害対応分野での有効性が広く認められました。',
      ),
      ExampleData(
        title: '「DX注目企業2025」に選定（経済産業省）',
        detail:
            '経済産業省が選定する「DX注目企業2025」に、K-DIVE®を中心としたコベルコ建機のDX取り組みが選ばれました。\n\n建設業界のデジタル変革をリードする取り組みとして高く評価されており、顧客からの引き合い増加や新規市場開拓につながっています。CX²（お客様対応変革）の成果として、デジタル技術を活用した競争力強化の典型事例です。',
      ),
    ],
  ),
  XCardData(
    key: 'EX',
    label: 'EX',
    title: '従業員体験向上',
    subtitle: '人材育成・働きやすい職場',
    color: const Color(0xFF085041),
    accentColor: const Color(0xFF0c7a62),
    icon: Icons.people,
    description:
        '変革を実現するために動く人一人ひとりの体験向上が必要です。働き方変革・D&I推進・人材育成に加え、安全で健康な職場づくりと風土変革を推進します。',
    examples: [
      ExampleData(
        title: 'DX人材育成プログラムの全社展開',
        detail:
            '全社員を対象に、基礎的なデジタルリテラシーから高度なデータ分析・AI活用スキルまでを段階的に習得できる育成プログラムを全社展開しています。\n\n「環境（ツール・インフラの整備）」「人材（スキルの習得）」「風土（チャレンジするマインド）」の3要素を同時に強化するアプローチで、単なる研修にとどまらない組織全体の変革を目指しています。',
      ),
      ExampleData(
        title: 'ダイバーシティ＆インクルージョンの施策推進',
        detail:
            '女性管理職比率の引き上げ・障がい者雇用の促進・外国籍社員の活躍支援など、多様な人材が能力を最大限発揮できる職場づくりを推進しています。\n\n多様な視点・経験・バックグラウンドを持つ人材が協働することで、イノベーション創出力が高まると考え、採用・評価・育成・職場環境の各側面からD&I施策を体系的に推進しています。',
      ),
      ExampleData(
        title: 'TQM研修のグループ全社展開',
        detail:
            'TQMの考え方と実践手法を学ぶ「TQM基礎研修」と、管理職向けの「TQMマネジメント研修」をグループ全体に展開しています。\n\n品質意識の浸透と改善文化の醸成を図るとともに、QCサークル活動との連携により現場レベルでの自律的改善を促進。全員参加型の品質向上活動がEXの重要な柱のひとつとなっています。',
      ),
    ],
  ),
  XCardData(
    key: 'DX',
    label: 'DX',
    title: 'すべての変革を加速する手段',
    subtitle: 'デジタル技術・データで全てのXを実現・加速・高度化',
    color: const Color(0xFF1a3a6b),
    accentColor: const Color(0xFF2a5aab),
    icon: Icons.hub,
    description:
        '他の全ての変革を、デジタル技術とデータの利活用（xD）でつなぎ、デジタル・データで実現・加速・高度化するための手段です。3つのSTEP（DX推進力強化→業務変革→KOBELCOならではの追求）で推進します。',
    examples: [
      ExampleData(
        title: 'STEP1：DX推進力の強化',
        detail:
            'クラウド環境・コラボレーションツール・データ基盤などデジタルインフラの整備と、全社員のデジタルリテラシー向上を並行して推進します。\n\n「変革を恐れない文化」の醸成もこのSTEPの重要な要素です。ツールを整えるだけでなく、社員が自律的にデジタルを活用して業務改善を進めるマインドセットの変革まで含めて「DX推進力」と定義しています。',
      ),
      ExampleData(
        title: 'STEP2：デジタル活用による各変革の実現・加速',
        detail:
            'BX（業務変革）・FX（ものづくり変革）・CX²（顧客対応変革）・EX（従業員体験向上）の各テーマに、AIやデータ分析技術を適用してその実現・加速を図ります。\n\n各事業部門での先行事例を横展開し、全社規模での変革を加速。デジタル活用の「勝ちパターン」を組織知として蓄積し、継続的な改善サイクルを回すことが目標です。',
      ),
      ExampleData(
        title: 'STEP3：KOBELCOならではの価値創出',
        detail:
            '素材・機械・建機など多様な事業を持つKOBELCOの強みを活かし、デジタルと掛け合わせることで社会課題の解決や新たな価値創出を目指します。\n\n「素材の知見×AI」「建機の稼働データ×クラウド」など、他社には真似できないKOBELCO固有の組み合わせによる独自ソリューションの開発がSTEP3の核心です。',
      ),
    ],
  ),
];
