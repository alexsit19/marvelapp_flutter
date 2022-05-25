import 'package:flutter/material.dart';

class EndOfList extends StatelessWidget {
  const EndOfList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 30,
        child: Text("End of list"),
      ),
    );
  }
}
