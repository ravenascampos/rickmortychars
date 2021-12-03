import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rickmortychars/data/model/character.dart';
import 'package:rickmortychars/data/model/episode.dart';
import 'package:rickmortychars/data/repository.dart';
import 'package:rickmortychars/view/components/info_label.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({
    required this.character,
    Key? key,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: 0.5,
          child: CachedNetworkImage(
            imageUrl: character.image,
            fit: BoxFit.cover,
          ),
        ),
        CachedNetworkImage(
          imageUrl: character.image,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 256,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoLabel(
                  title: 'Status',
                  label: character.status,
                ),
                const SizedBox(height: 8),
                FutureBuilder<Episode>(
                  future: Repository.getEpisode(character.episode.first),
                  builder: (context, snapshot) {
                    final episode = snapshot.data;

                    return InfoLabel(
                      title: 'Primeira aparição',
                      label:
                          '${episode?.name ?? '...'} - ${episode?.episode ?? '...'}',
                    );
                  },
                ),
                const SizedBox(height: 8),
                InfoLabel(
                  title: 'Origem',
                  label: character.origin.name,
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
                const SizedBox(height: 8),
                InfoLabel(
                  title: 'Gênero',
                  label: character.gender,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
