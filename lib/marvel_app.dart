import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/screens/home_screen.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      home: HomeScreen(),
      //onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
