import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String rootRoute = '/';
  static String login = '/login';
  static String signUp = '/sign-up';
  static String recover = '/recover';
  static String home = '/home';
}

final router = GoRouter(routes: []);

page({required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(
      key: state.pageKey,
      child: child,
    );
