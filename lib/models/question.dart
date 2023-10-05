class Question {
  final int id;
  final String text;
  final int weight;
  final String kind;
  final bool yesNo;
  final Map<String, dynamic> options;

  Question({
    required this.id,
    required this.text,
    required this.weight,
    required this.kind,
    required this.yesNo,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      text: json['text'],
      weight: json['weight'],
      kind: json['kind'],
      yesNo: json['yes_no'],
      options: json['options'] == null
          ? {}
          : Map<String, dynamic>.from(json['options']),
    );
  }
}
