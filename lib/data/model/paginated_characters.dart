import 'dart:convert';

import 'package:rickmortychars/data/model/character.dart';
import 'package:rickmortychars/data/model/paginated_info.dart';

class PaginatedCharacters {
  PaginatedCharacters({
    required this.info,
    required this.results,
  });

  final PaginatedInfo info;
  final List<Character> results;

  Map<String, dynamic> toMap() {
    return {
      'info': info.toMap(),
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory PaginatedCharacters.fromMap(Map<String, dynamic> map) {
    return PaginatedCharacters(
      info: PaginatedInfo.fromMap(map['info']),
      results: List<Character>.from(
          map['results']?.map((x) => Character.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginatedCharacters.fromJson(String source) =>
      PaginatedCharacters.fromMap(json.decode(source));
}
