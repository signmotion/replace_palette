// ignore_for_file: avoid_print

import 'dart:io';

import 'package:image/image.dart';
import 'package:replace_palette/replace_palette.dart';
import 'package:uni_color_name/uni_color_name.dart';

/// Run:
/// ```
/// cd example
/// dart main.dart
/// ```
Future<void> main() async {
  const fileSource = 'colorful_swirl';
  const filesPalettes = ['black_white', 'faber_castell_36'];
  for (final fp in filesPalettes) {
    await dress(fileSource, fp);
  }
  print('✅ Files created in the `example` folder.');
}

Future<void> dress(String fileSource, String filePalette) async {
  final palette = UniPalette<int>.file(
    'palettes/$filePalette.json',
    ColorModel.rgb,
  );
  final image =
      await const Dresser().dressFile(File('data/$fileSource.webp'), palette);
  File('../_output/${fileSource}_$filePalette.png')
    ..createSync(recursive: true)
    ..writeAsBytesSync(encodePng(image));
}

Future<void> dressExample() async {
  final palette = UniPalette<int>.file('my_palette.json', ColorModel.rgb);
  final image = await const Dresser().dressFile(File('my_image.webp'), palette);
  File('my_result.png')
    ..createSync(recursive: true)
    ..writeAsBytesSync(encodePng(image));
}
