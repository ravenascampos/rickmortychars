import 'dart:convert';

class Origin {
  const Origin({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Origin.fromMap(Map<String, dynamic> map) {
    return Origin(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Origin.fromJson(String source) => Origin.fromMap(json.decode(source));
}
