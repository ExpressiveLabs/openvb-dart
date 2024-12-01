# OpenVBconf for Dart
This repository contains a Dart implementation of the OpenVBconf standard, developed by ExpressiveLabs. It relies on a small Rust core that uses the [`openvb-rs`](https://github.com/ExpressiveLabs/openvb-rs) crate to read and write encoded OpenVB config files.

## Installation
This package is not on pub.dev (yet). To use it, add the following to your `pubspec.yaml`:
```yaml
dependencies:
  # ...
  openvb:
    git:
      url: https://github.com/ExpressiveLabs/openvb-dart.git
```

## How to use
This package relies on native assets. Compile with the `--enable-experiment=native-assets` flag:
```bash
dart --enable-experiment=native-assets` run
```

Usage is pretty straightforward:
```dart
import <package:openvb/openvb.dart>

Singer? singer = Singer.fromFile("path/to/singer.json");
```

## License
Copyright © 2024 ExpressiveLabs.

This package is licensed under an MIT license. See [LICENSE.md](LICENSE.md) for a copy of this license.