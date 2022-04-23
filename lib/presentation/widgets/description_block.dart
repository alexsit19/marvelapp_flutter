import 'package:flutter/material.dart';
import '../../data/model/response_models/character.dart';

class DescriptionBlock extends StatelessWidget {
  final Character character;

  const DescriptionBlock({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 4.0),
          child: Row(
            children: const [
              Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
          child: Text(
            character.description as String,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
    ;
  }
}
