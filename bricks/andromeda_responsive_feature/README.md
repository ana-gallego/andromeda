# 🧱 Andromeda responsive feature

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

Generate a new Flutter responsive feature with riverpod.

## Usage 🚀

```sh
mason make andromeda_responsive_feature --name example --view counter
```

## Variables ✨

| Variable | Description                 | Default         | Type     |
| -------- | --------------------------- | ----------------| -------- |
| `name`   | The name of the feature     | `example`       | `string` |
| `type`   | The type of the first page  | `counter`       | `string` |

## Output 📦

```sh
── example
   ├── data
   │   └── example_repository.dart
   ├── domain
   │   └── example.dart
   └── presentation
       └── counter
            ├── layouts
            │   ├── desktop_layout.dart
            │   ├── ipad_layout.dart
            │   ├── mobile_layout.dart
            │   └── layouts.dart
            ├── widgets
            │    └── greeting.dart
            ├── counter_page.dart
            ├── counter_controller.dart
            └── counter_state.dart
```

## 🚧 Requirements

* Make sure you have riverpod package inside your `pubspec.yaml` file.

* Make sure you have `ResponsivePage` inside your code:

```dart
class ResponsivePage extends StatelessWidget {
  final Widget desktop, ipad, mobile;
  const ResponsivePage(
      {Key? key,
      required this.desktop,
      required this.ipad,
      required this.mobile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (deviceByWidth(context)) {
      case Device.desktop:
        return desktop;
      case Device.ipad:
        return ipad;
      case Device.mobile:
        return mobile;
    }
  }

  Device deviceByWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width <= 550) return Device.mobile;
    if (width <= 768) return Device.ipad;
    if (width <= 1440) return Device.desktop;
    return Device.desktop;
  }
}

enum Device {
  desktop,
  ipad,
  mobile,
}
```
