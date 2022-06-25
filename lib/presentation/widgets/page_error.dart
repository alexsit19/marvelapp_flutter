import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/Localization/app_localizations.dart';

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
            AppLocalizations.of(context).translate("pleaseCheckInternetConnection"),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(AppLocalizations.of(context).translate("tapToTryAgain")),
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
