import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/Localization/app_localizations.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/home/bloc/home_event.dart';

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
          child: Text('$errorText. ${AppLocalizations.of(context).translate("tapToTryAgain")}'),
        ),
      ),
    );
  }
}
