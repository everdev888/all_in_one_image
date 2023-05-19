import 'dart:io';
import 'package:all_in_one_image/src/all_image.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('loadImage loads PNG file', (WidgetTester tester) async {
    final imageFile = File('test_assets/test.png');
    final widget = loadImage(imageFile);
    await tester.pumpWidget(widget);
    expect(find.byWidget(widget), findsOneWidget);
  });

  testWidgets('loadImage loads SVG file', (WidgetTester tester) async {
    final imageFile = File('test_assets/test.svg');
    final widget = loadImage(imageFile);
    await tester.pumpWidget(widget);
    expect(find.byWidget(widget), findsOneWidget);
  });

  testWidgets('loadByteArray loads JPEG byte array',
      (WidgetTester tester) async {
    final byteArray = File('test_assets/test.jpg').readAsBytesSync();
    final widget = loadByteArray(byteArray, 'image/jpeg');
    await tester.pumpWidget(widget);
    expect(find.byWidget(widget), findsOneWidget);
  });

  testWidgets('loadByteArray loads WebP byte array',
      (WidgetTester tester) async {
    final byteArray = File('test_assets/test.webp').readAsBytesSync();
    final widget = loadByteArray(byteArray, 'image/webp');
    await tester.pumpWidget(widget);
    expect(find.byWidget(widget), findsOneWidget);
  });

  testWidgets('pickImage picks an image from gallery',
      (WidgetTester tester) async {
    final file = await pickImage();
    expect(file, isNotNull);
  });

  testWidgets('loadImageFromUrl loads an image from URL',
      (WidgetTester tester) async {
    final url = 'https://picsum.photos/200/300';
    final widget = await loadImageFromUrl(url);
    expect(widget, isNotNull);
  });

  testWidgets('loadImageFromAsset loads an image from asset',
      (WidgetTester tester) async {
    final assetName = 'test_assets/test.png';
    final widget = loadImageFromAsset(assetName);
    await tester.pumpWidget(widget);
    expect(find.byWidget(widget), findsOneWidget);
  });
}
