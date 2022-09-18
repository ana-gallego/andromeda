import 'package:flutter_riverpod/flutter_riverpod.dart';
import '{{page.snakeCase()}}_state.dart';

class {{page.pascalCase()}}Controller extends StateNotifier<{{page.pascalCase()}}State> {
 
  {{page.pascalCase()}}Controller(): super({{page.pascalCase()}}State());
}

final {{page.camelCase()}}Controller =
    StateNotifierProvider<{{page.pascalCase()}}Controller, {{page.pascalCase()}}State>(
        (ref) {
  return {{page.pascalCase()}}Controller();
});