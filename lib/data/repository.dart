import 'package:dio/dio.dart';
import 'package:rickmortychars/data/model/character.dart';
import 'package:rickmortychars/data/model/episode.dart';
import 'package:rickmortychars/data/model/paginated_characters.dart';

abstract class Repository {
  static const _baseUrl = 'https://rickandmortyapi.com/api/character';

  static final _dio = Dio();

  static Future<PaginatedCharacters> getAllCharacters(String? url) async {
    final response = await _dio.get(url ?? _baseUrl);

    final charactersPage = PaginatedCharacters.fromMap(response.data);

    return charactersPage;
  }

  static Future<Character> getCharacter(int id) async {
    final response = await _dio.get('$_baseUrl/$id');

    final character = Character.fromMap(response.data);

    return character;
  }

  static Future<Episode> getEpisode(String url) async {
    final response = await _dio.get(url);

    final episode = Episode.fromMap(response.data);

    return episode;
  }
}
