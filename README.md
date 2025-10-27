# start_service

A Flutter package that handles policy checks on app startup. If a policy is available, it displays the policy screen; otherwise, it shows the main app.

## Features

- Automatic policy checking on app launch
- Displays policy screen if policy exists
- Falls back to main app if no policy
- Black loading screen during policy check

## Usage

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  start_service:
    git:
      url: https://github.com/wiwoteam/startservice.git
```

Or if published to pub.dev:

```yaml
dependencies:
  start_service: ^0.1.0
```

Then, in your `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:start_service/start_service.dart';

void main() {
  runApp(StartService(child: const MyApp()));
}
```

Replace `MyApp` with your main app widget.

## Example

See the `example/` directory for a complete example.