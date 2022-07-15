import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/presentation/widgets/switch_locale_button.dart';
import 'package:marvelapp_flutter/presentation/widgets/switch_theme_button.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  final String title;

  AppBarCustom({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text(title),
      actions: [
        SwitchThemeButton(),
        SwitchLocaleButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

