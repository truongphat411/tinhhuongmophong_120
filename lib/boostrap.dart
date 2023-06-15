import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tinhhuongmophong_120/app/view/app.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  await runZonedGuarded<Future<void>>(
    () async {
      runApp(
        const App(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
