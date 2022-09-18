# 🧱 Andromeda responsive page

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

Generate a new Flutter responsive page with riverpod.

## Usage 🚀

```sh
mason make andromeda_responsive_page --name counter
```

## Variables ✨

| Variable | Description              | Default         | Type     |
| -------- | -------------------------| ----------------| -------- |
| `name`   | The name of the page     | `counter`       | `string` |

## Output 📦

```sh
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
