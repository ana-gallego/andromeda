import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../{{page.snakeCase()}}_controller.dart';

class {{page.pascalCase()}}PageDesktopLayout extends ConsumerWidget {
  const {{page.pascalCase()}}PageDesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch({{page.camelCase()}}Controller.notifier);
    var state = ref.watch({{page.camelCase()}}Controller);
  return Container();
    }
}