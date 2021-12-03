import 'package:flutter/material.dart';
import 'package:rickmortychars/data/model/paginated_characters.dart';
import 'package:rickmortychars/data/repository.dart';
import 'package:rickmortychars/view/components/characters_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? searchName;
  String? path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Rick & Morty API'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    onChanged: (value) async {
                      await Future.delayed(
                        const Duration(seconds: 2),
                      );

                      setState(() {
                        searchName = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: FutureBuilder<PaginatedCharacters>(
        future: Repository.getAllCharacters(path),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final charactersPage = snapshot.data!;

              return Center(
                child: CharacterPageView(
                  onListMove: (isMoving) {
                    setState(
                      () {
                        if (isMoving && charactersPage.info.next != null) {
                          path = charactersPage.info.next;
                        } else if (!isMoving &&
                            charactersPage.info.prev != null) {
                          path = charactersPage.info.prev;
                        }
                      },
                    );
                  },
                  characterList: charactersPage.results
                      .where(
                        (character) => character.name
                            .toLowerCase()
                            .contains(searchName?.toLowerCase() ?? ''),
                      )
                      .toList(),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  "Ocorreu um erro.",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
