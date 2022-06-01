import 'package:flutter/material.dart';

class CenterLoader extends StatelessWidget {
  const CenterLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
