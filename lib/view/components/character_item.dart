import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rickmortychars/data/model/character.dart';
import 'package:rickmortychars/view/components/info_label.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({required this.character, Key? key}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CachedNetworkImage(
          imageUrl: character.image,
          placeholder: (context, url) {
            return Opacity(
              opacity: 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/kobe_logo.png',
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, left: 32, right: 32),
                    child: LinearProgressIndicator(),
                  ),
                ],
              ),
            );
          },
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 184,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  blurRadius: 64,
                  spreadRadius: 32,
                  offset: Offset(0, 16),
                )
              ],
            ),
            child: Column(
              children: [
                Flexible(
                  child: Text(
                    character.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
                InfoLabel(
                  title: 'Status',
                  label: character.status,
                ),
                const SizedBox(height: 8),
                InfoLabel(
                  title: 'Última localização',
                  label: character.location.name,
                ),
                const SizedBox(height: 8),
                InfoLabel(
                  title: 'Espécie',
                  label: character.species,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
