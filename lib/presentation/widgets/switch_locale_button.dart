import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SwitchLocaleButton extends StatefulWidget {
  const SwitchLocaleButton({Key? key}) : super(key: key);

  @override
  State<SwitchLocaleButton> createState() => _SwitchLocaleButtonState();
}

class _SwitchLocaleButtonState extends State<SwitchLocaleButton> {
  String currentLocale = "Ru";

  @override
  void didChangeDependencies() {
    Locale myLocale = Localizations.localeOf(context);
    //currentLocale = myLocale as String;
    super.didChangeDependencies();
  }

  void _toggleLocale() {
    setState(() {
      if (currentLocale == "Ru") {
        currentLocale = "En";
      } else {
        currentLocale = "Ru";
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
    if (currentLocale == "Ru") {
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
