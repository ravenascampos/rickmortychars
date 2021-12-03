import 'dart:convert';

class PaginatedInfo {
  const PaginatedInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  final int count;
  final int pages;
  final String? next;
  final String? prev;

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }

  factory PaginatedInfo.fromMap(Map<String, dynamic> map) {
    return PaginatedInfo(
      count: map['count'],
      pages: map['pages'],
      next: map['next'],
      prev: map['prev'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedInfo.fromJson(String source) =>
      PaginatedInfo.fromMap(json.decode(source));
}
