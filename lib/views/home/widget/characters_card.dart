import 'package:flutter/material.dart';

class CharactersCard extends StatelessWidget {
final String image;
final String name;

  const CharactersCard({Key key, this.image, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.network(image),
      Text(name)
    ],);
  }
}
