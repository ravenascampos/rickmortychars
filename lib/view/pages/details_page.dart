import 'package:flutter/material.dart';
import 'package:rickmortychars/data/model/character.dart';
import 'package:rickmortychars/data/repository.dart';
import 'package:rickmortychars/view/components/character_details.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Character>(
      future: Repository.getCharacter(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final character = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                title: Text(character.name),
              ),
              body: CharacterDetails(
                character: character,
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
    );
  }
}
