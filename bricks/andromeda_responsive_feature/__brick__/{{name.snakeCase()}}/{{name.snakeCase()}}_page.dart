import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '{{name.snakeCase()}}_controller.dart';


class {{name.pascalCase()}}Page extends ConsumerWidget {
  const {{name.pascalCase()}}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch({{name.camelCase()}}Controller.notifier);
    var state = ref.watch({{name.camelCase()}}Controller);
    return Container();
  }
}