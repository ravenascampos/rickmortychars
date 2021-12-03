import 'package:flutter/material.dart';
import 'package:rickmortychars/view/pages/details_page.dart';
import 'package:rickmortychars/view/pages/home_page.dart';

void main() {
  runApp(
    const RickMortyCharsApp(),
  );
}

class RickMortyCharsApp extends StatelessWidget {
  const RickMortyCharsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const HomePage(),
            );
          case '/details':
            int id = settings.arguments as int;
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => DetailsPage(id: id),
            );
          default:
            return null;
        }
      },
    );
  }
}
