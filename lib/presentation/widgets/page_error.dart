import 'package:flutter/material.dart';

class PageError extends StatelessWidget {
  final Function() onRetry;
  final String errorText;

  const PageError({Key? key, required this.onRetry, required this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorText,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Please check internet connection",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text("Tap to try again"),
                Icon(
                  Icons.refresh,
                  size: 24.0,
                ),
              ],
            ),
            onPressed: () {
              onRetry();
            },
          ),
        ],
      ),
    );
  }
}
