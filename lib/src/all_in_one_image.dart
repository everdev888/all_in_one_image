import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

/// Loads an image file and returns a widget that can display it.
Widget loadImage(File imageFile) {
  if (imageFile.path.endsWith('.svg')) {
    return SvgPicture.file(imageFile);
  } else {
    return Image.file(imageFile);
  }
}

/// Loads a byte array and a mime type and returns a widget that can display it.
Widget loadByteArray(Uint8List byteArray, String mimeType) {
  if (mimeType == 'image/svg+xml') {
    return SvgPicture.memory(byteArray);
  } else {
    return Image.memory(byteArray);
  }
}

/// Opens the device's gallery and returns a File object representing the selected image.
Future<File?> pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}

/// Loads an image from a network URL and returns a widget that can display it.
Future<Widget?> loadImageFromUrl(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final mimeType = response.headers['content-type'];
    final byteArray = response.bodyBytes;
    return loadByteArray(byteArray, mimeType!);
  } else {
    return null;
  }
}

/// Loads an image from an asset and returns a widget that can display it.
Widget loadImageFromAsset(String assetName) {
  if (assetName.endsWith('.svg')) {
    return SvgPicture.asset(assetName);
  } else {
    return Image.asset(assetName);
  }
}
