import 'package:flutter/material.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
      //onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
