# All in One Image Flutter Package

A Flutter package for loading images from various sources.

## Getting Started

To use this package, add `all_in_one_image` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  all_in_one_image: ^1.0.0


Then, import the package in your Dart code:

import 'package:my_image_package/my_image_package.dart';

You can then use the package's functions to load images from different sources. For example:

// Load an image from a file
final imageFile = File('path/to/image.png');
final widget = loadImage(imageFile);

// Load an image from a URL
final url = 'https://example.com/image.png';
final widget = await loadImageFromUrl(url);

// Load an image from an asset
final assetName = 'images/image.png';
final widget = loadImageFromAsset(assetName);


For more information on how to use the package, see the API documentation or the included example app.

API Documentation
The package includes the following functions:

loadImage: Loads an image file and returns a widget that can displayit.
loadByteArray: Loads a byte array and a mime type and returns a widget that can display it.
pickImage: Opens the device's gallery and returns a File object representing the selected image- loadImageFromUrl: Loads an image from a network URL and returns a widget that can display it.
loadImageFromAsset: Loads an image from an asset and returns a widget that can display it.
For more information on each function, see the API documentation in the lib directory.

Example App
The package includes an example app that demonstrates how to use the package's functions to load images from different sources. To run the example app, clone the repository and run the following command:

flutter run example/lib/main.dart

Contributing
If you find a bug or would like to suggest a new feature, please open an issue on GitHub. Pull requests are also welcome.

License
This package is released under the MIT License. See LICENSE for more information.