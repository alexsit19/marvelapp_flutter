import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelapp_flutter/presentation/localization/app_localizations.dart';
import 'package:marvelapp_flutter/presentation/features/localization/bloc/localization_bloc.dart';
import 'package:marvelapp_flutter/presentation/features/localization/bloc/localization_event.dart';

class SwitchLocaleButton extends StatefulWidget {
  const SwitchLocaleButton({Key? key}) : super(key: key);

  @override
  State<SwitchLocaleButton> createState() => _SwitchLocaleButtonState();
}

class _SwitchLocaleButtonState extends State<SwitchLocaleButton> {
  String currentLocale = "ru";

  @override
  void didChangeDependencies() {
    Locale myLocale = Localizations.localeOf(context);
    currentLocale = myLocale.toString();
    super.didChangeDependencies();
  }

  void _toggleLocale() {
    setState(() {
      if (AppLocalizations.of(context).isEnLocale) {
        BlocProvider.of<LocalizationBloc>(context).add(SetLocalRu());
        currentLocale = "ru";
      } else {
        BlocProvider.of<LocalizationBloc>(context).add(SetLocalEn());
        currentLocale = "en";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _toggleLocale();
      },
      child: _getText(),
    );
  }

  Widget _getText() {
    if (currentLocale == "ru") {
      return RichText(
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "En",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
            ),
            TextSpan(
              text: "/",
            ),
            TextSpan(
              text: "Ru",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      );
    } else {
      return RichText(
        text: const TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "En",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
            ),
            TextSpan(
              text: "/",
            ),
            TextSpan(
              text: "Ru",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      );
    }
  }
}

