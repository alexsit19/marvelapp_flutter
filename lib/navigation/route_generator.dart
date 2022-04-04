import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/navigation/app_routes.dart';
import 'package:marvelapp_flutter/screens/details_screen.dart';
import 'package:marvelapp_flutter/screens/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case AppRoutes.detailScreen:
        return MaterialPageRoute(settings: settings, builder: (context) => DetailsScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ERROR'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('Page not found'),
          ),
        );
      },
    );
  }
}
