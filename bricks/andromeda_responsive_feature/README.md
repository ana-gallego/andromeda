# 🧱 Andromeda responsive feature

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

Generate a new Flutter responsivefeature with riverpod.

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
