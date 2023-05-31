import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vsounds/feature/discover/ui/pack_detail.dart';
import 'package:vsounds/feature/root/root_page.dart';
import 'package:vsounds/feature/start/start_page.dart';
import 'package:vsounds/router/paths.dart';
import 'package:vsounds/splash.dart';

// const _scaffoldKey = ValueKey<String>('App scaffold');

final goRouterConfiguration = GoRouter(
  // init routes
  initialLocation: Paths.splash,
  // Show debugging logs.
  debugLogDiagnostics: true,

  // redirect: _handleRedirect,

  redirect: _guard,

  routes: [
    GoRoute(
      path: Paths.splash,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const SplashPage(),
      ),
    ),

    GoRoute(
      path: Paths.start,
      builder: (context, state) {
        return const StartPage();
      },
    ),
    GoRoute(
      path: Paths.root,
      builder: (context, state) {
        return const RootPage();
      },
    ),
    GoRoute(
      path: Paths.packDetail,
      builder: (context, state) {
        return const PackdetailPage();
      },
    ),

    // GoRoute(
    //   path: Paths.eventDetail,
    //   builder: (context, state) {
    //     return EventDetail(
    //       event: state.extra as Event,
    //     );
    //   },
    // ),
  ],
);

String? _guard(BuildContext context, GoRouterState state) {
  // final bool signedIn = _auth.signedIn;
  // final bool signingIn = state.subloc == '/signin';

  // // Go to /signin if the user is not signed in
  // if (!signedIn && !signingIn) {
  //   return '/signin';
  // }
  // // Go to /books if the user is signed in and tries to go to /signin.
  // else if (signedIn && signingIn) {
  //   return '/books';
  // }

  // no redirect
  return null;
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ),
            child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}
