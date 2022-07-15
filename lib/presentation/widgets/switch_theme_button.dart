import 'package:flutter/material.dart';

class SwitchThemeButton extends StatefulWidget {
  const SwitchThemeButton({Key? key}) : super(key: key);

  @override
  State<SwitchThemeButton> createState() => _SwitchThemeButtonState();
}

class _SwitchThemeButtonState extends State<SwitchThemeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.palette_outlined),
    );
  }
}
