import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/presentation/utils/from_key_to_string.dart';

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
          Text(
            context.translate("pleaseCheckInternetConnection"),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(context.translate("tapToTryAgain")),
                const Icon(
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
