import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'src/app.dart';

void main() {
  // turn off the # in the URLs on the web
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(const ProviderScope(child: MyApp()));
}
