import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';
import 'package:marvelapp_flutter/presentation/localization/utils/from_key_to_string.dart';

class BottomError extends StatelessWidget {
  final String errorText;

  const BottomError({Key? key, required this.errorText}) : super(key: key);

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
            context.read<HomeBloc>().add(ScrolledToEnd());
          },
          child: Text('$errorText. ${context.translate("tapToTryAgain")}'),
        ),
      ),
    );
  }
}
