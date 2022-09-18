import 'package:flutter_riverpod/flutter_riverpod.dart';
import '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Controller extends StateNotifier<{{name.pascalCase()}}State> {
 
  {{name.pascalCase()}}Controller(): super({{name.pascalCase()}}State());
}

final {{name.camelCase()}}Controller =
    StateNotifierProvider<{{name.pascalCase()}}Controller, {{name.pascalCase()}}State>(
        (ref) {
  return {{name.pascalCase()}}Controller();
});