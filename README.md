# flutter_common

Common Flutter UI components and utilities for shAdow-XJY Manager projects.

## Features

- **BlurGlass**: Glassmorphism container with backdrop blur effect
- **GradientProgressBar**: Colorful gradient progress indicator
- **MdWidget**: Markdown document viewer with GitHub-flavored syntax
- **SiteStyle**: Consistent color palette and typography

## Installation

Add this package as a local dependency in your `pubspec.yaml`:

```yaml
dependencies:
  flutter_common:
    path: ../../workspaces/util/pac/flutter_common
```

## Usage

### BlurGlass

```dart
import 'package:flutter_common/flutter_common.dart';

BlurGlass(
  marginValue: 20.0,
  paddingValue: 16.0,
  child: Text('Frosted glass effect'),
)
```

### GradientProgressBar

```dart
import 'package:flutter_common/flutter_common.dart';

GradientProgressBar(
  value: 0.7,  // 70% progress
  height: 10,
)
```

### MdWidget

```dart
import 'package:flutter_common/flutter_common.dart';

MdWidget(
  title: 'Documentation',
  path: 'assets/docs/readme.md',
)
```

### SiteStyle

```dart
import 'package:flutter_common/flutter_common.dart';

Container(
  color: siteBackground,
  child: Text(
    'Styled text',
    style: siteHeading,
  ),
)
```

## Components

### Colors

- `siteBackground` - Main background color (#222236)
- `siteSurface` - Surface/card color (#29283F)
- `siteSelected` - Selected item color (#3D375B)
- `siteAccent` - Accent/primary color (#8060FF)
- `siteMuted` - Muted text color (#B8B5CE)
- `siteDivider` - Divider line color (#3C3A51)

### Text Styles

- `siteBody` - Body text style (14px, 1.6 line height)
- `siteHeading` - Heading text style (22px, 1.3 line height)

## License

See LICENSE file.
