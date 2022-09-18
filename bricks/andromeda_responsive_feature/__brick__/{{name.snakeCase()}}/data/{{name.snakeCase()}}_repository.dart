import 'package:flutter_riverpod/flutter_riverpod.dart';

class {{name.pascalCase()}}Repository {
 
}

final {{name.camelCase()}}RepositoryProvider = Provider.autoDispose<{{name.pascalCase()}}Repository>(
  (ref) => {{name.pascalCase()}}Repository(),
);