class DohaModel {
  final String hindi;
  final String english;
  final String gujarati;
  final String meaningHindi;
  final String meaningEnglish;
  final String meaningGujarati;

  DohaModel({
    required this.hindi,
    required this.english,
    required this.gujarati,
    required this.meaningHindi,
    required this.meaningEnglish,
    required this.meaningGujarati,
  });

  factory DohaModel.fromJson(Map<String, dynamic> json) {
    return DohaModel(
      hindi: json['hindi'],
      english: json['english'],
      gujarati: json['gujarati'],
      meaningHindi: json['meaningHindi'],
      meaningEnglish: json['meaningEnglish'],
      meaningGujarati: json['meaningGujarati'],
    );
  }
}
