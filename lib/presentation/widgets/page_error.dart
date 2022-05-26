import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/details/bloc/details_event.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';

const String homeScreen = "homeScreen";
const String detailsScreen = "detailsScreen";

class PageError extends StatelessWidget {
  final String screen;
  final String? id;

  const PageError({Key? key, required this.screen, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "No connection.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Please check internet connection and ",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text("try again"),
                Icon(
                  Icons.refresh,
                  size: 24.0,
                ),
              ],
            ),
            onPressed: () {
              switch (screen) {
                case homeScreen:
                  context.read<HomeBloc>().add(GetHeroes());
                  break;
                case detailsScreen:
                  if (id != null) {
                    context.read<DetailsBloc>().add(GetCharacterDetail(characterId: id as String));
                  }
              }
            },
          ),
        ],
      ),
    );
  }
}
