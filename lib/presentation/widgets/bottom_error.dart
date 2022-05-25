import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../features/home/bloc/home_bloc.dart';
import '../features/home/bloc/home_event.dart';

class BottomError extends StatelessWidget {
  const BottomError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        height: 70,
        child: TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 14),
          ),
          onPressed: () {
            context.read<HomeBloc>().add(GetHeroes());
          },
          child: const Text('Something went wrong. Tap to try again'),
        ),
      ),
    );
  }
}
