import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Common ancestor of all IK apps.
class HotelsoftwareApp extends HookConsumerWidget {
/*┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  ┃ Attributes                                                                 ┃
  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛*/
  /// The app specific start page.
  final Widget home;

  /// The app specific title.
  final String title;

  /// Allows only landscape orientation.
  final bool onlyLandscape;

  /// Allows only horizontal orientation.
  final bool onlyHorizontal;

  /// The app specific initialization logic.
  /// You are free to use ref for accessing the providers.
  final Function(WidgetRef ref)? onInit;

  /// The app specific routes.
  final Map<String, Widget Function(BuildContext)> routes;

  /// The app specific theme.
  final ThemeData? themeData;

  /// The global navigaror key which is used for navigation without local context.
  final GlobalKey<NavigatorState>? navigatorKey;

  /// The default scroll behavior of the app. We use this to enable mouse drag on
  /// Windows devices in IKKassenbuch. Otherwise the scrolling through the statistics
  /// screen in its main windows would not be possible.
  final ScrollBehavior? scrollBehavior;

/*┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  ┃ Constructors                                                               ┃
  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛*/
  /// Constructor for the common ancestor of all IK apps.
  const HotelsoftwareApp({
    required this.home,
    required this.title,
    this.scrollBehavior,
    this.navigatorKey,
    this.themeData,
    this.onInit,
    this.routes = const <String, WidgetBuilder>{},
    this.onlyLandscape = false,
    this.onlyHorizontal = false,
    Key? key,
  }) : super(key: key);

/*┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  ┃ Methods                                                                    ┃
  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛*/
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (onInit != null) {
      onInit!(ref);
    }
    assert(!onlyLandscape || !onlyHorizontal); // both cannot be true
    if (onlyHorizontal) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]).then((value) => {
            MaterialApp(
              title: title,
              theme: themeData ??
                  ThemeData(
                    primarySwatch: Colors.blue,
                  ),
              scrollBehavior: scrollBehavior,
              home: home,
              routes: routes,
              navigatorKey: navigatorKey,
            )
          });
    }
    if (onlyLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]).then((value) => {
            MaterialApp(
              title: title,
              theme: themeData ??
                  ThemeData(
                    primarySwatch: Colors.blue,
                  ),
              scrollBehavior: scrollBehavior,
              home: home,
              routes: routes,
              navigatorKey: navigatorKey,
            )
          });
    }

    return MaterialApp(
      title: title,
      theme: themeData ??
          ThemeData(
            primarySwatch: Colors.blue,
          ),
      scrollBehavior: scrollBehavior,
      home: home,
      routes: routes,
      navigatorKey: navigatorKey,
    );
  }
}
