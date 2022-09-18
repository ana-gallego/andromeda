class {{page.pascalCase()}}DesktopLayout extends ConsumerWidget {
  const {{page.pascalCase()}}DesktopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch({{page.camelCase()}}Controller.notifier);
    var state = ref.watch({{page.camelCase()}}Controller);
  return Container();
    }
}