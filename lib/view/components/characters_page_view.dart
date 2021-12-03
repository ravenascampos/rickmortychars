import 'package:flutter/material.dart';
import 'package:rickmortychars/data/model/character.dart';
import 'package:rickmortychars/view/components/character_item.dart';

class CharacterPageView extends StatefulWidget {
  const CharacterPageView({
    required this.characterList,
    required this.onListMove,
    Key? key,
  }) : super(key: key);

  final List<Character> characterList;
  final ValueChanged<bool> onListMove;

  @override
  _CharacterPageViewState createState() => _CharacterPageViewState();
}

class _CharacterPageViewState extends State<CharacterPageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.characterList.isEmpty) {
      return GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx < 0) {
            widget.onListMove(true);
          } else {
            widget.onListMove(false);
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Nenhum personagem encontrado neste grupo',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      );
    } else {
      return PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              '/details',
              arguments: widget.characterList[index].id,
            );
          },
          onPanUpdate: (details) {
            if (details.delta.dx < 0) {
              final newIndex = index + 1;
              if (newIndex >= widget.characterList.length) {
                widget.onListMove(true);
              } else {
                _animateToPage(newIndex);
              }
            } else {
              if (index != 0) {
                _animateToPage(index - 1);
              } else {
                widget.onListMove(false);
              }
            }
          },
          child: CharacterItem(
            character: widget.characterList[index],
          ),
        ),
        itemCount: widget.characterList.length,
      );
    }
  }
}
