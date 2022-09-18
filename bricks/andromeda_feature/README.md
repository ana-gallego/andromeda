# 🧱 Andromeda responsive feature

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

Generate a new Flutter feature with riverpod.

## Usage 🚀

```sh
mason make andromeda_feature --name example --view counter
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
            ├── widgets
            │    └── greeting.dart
            ├── counter_page.dart
            ├── counter_controller.dart
            └── counter_state.dart
```
