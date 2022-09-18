import 'package:epik_clientes/src/features/authentication/presentation/sign_in/sign_in_page.dart';
import 'package:epik_clientes/src/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String rootRoute = '/';
  static String login = '/login';
  static String signUp = '/sign-up';
  static String recover = '/recover';
  static String home = '/home';
}

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    pageBuilder: (context, state) =>
        page(state: state, child: const SignInPage()),
  ),
  GoRoute(
    path: '/sign-in',
    pageBuilder: (context, state) =>
        page(state: state, child: const SignInPage()),
  ),
  GoRoute(
    path: '/home',
    pageBuilder: (context, state) =>
        page(state: state, child: const HomePage()),
  ),
]);

page({required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(
      key: state.pageKey,
      child: child,
    );
