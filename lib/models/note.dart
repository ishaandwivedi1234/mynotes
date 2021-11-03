class Note {
  String title;
  String desc;
  String tag;

  Note({required this.title, required this.desc, required this.tag});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(title: json['title'], desc: json['desc'], tag: json['tag']);
  }
}
