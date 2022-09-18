import 'package:flutter/material.dart';
import 'layouts/layouts.dart';

class {{page.pascalCase()}}Page extends StatelessWidget {
  const {{page.pascalCase()}}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsivePage(
        desktop: {{page.pascalCase()}}PageDesktopLayout(),
        ipad: {{page.pascalCase()}}PageIpadLayout(),
        mobile: {{page.pascalCase()}}PageMobileLayout(),
     );
  }
}
