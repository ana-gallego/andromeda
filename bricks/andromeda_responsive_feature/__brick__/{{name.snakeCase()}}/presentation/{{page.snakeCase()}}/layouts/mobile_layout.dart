class {{page.pascalCase()}}MobileLayout extends ConsumerWidget {
  const {{page.pascalCase()}}MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch({{page.camelCase()}}Controller.notifier);
    var state = ref.watch({{page.camelCase()}}Controller);
  return Container();
    }
}