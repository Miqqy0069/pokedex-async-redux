import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/routes.dart';

void main() {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

  runApp(
    StoreProvider(
      store: store,
      child: MaterialApp(
        routes: routes,
        theme: ThemeData(primarySwatch: Colors.red),
      ),
    ),
  );
}
