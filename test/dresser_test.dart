// ignore_for_file: avoid_print

import 'dart:io';

import 'package:image/image.dart' hide Palette;
import 'package:replace_palette/replace_palette.dart';
import 'package:test/test.dart';
import 'package:uni_color_model/uni_color_model.dart';

import 'utils.dart';

void main() async {
  group('Dresser - some real palettes', () {
    const dresser = Dresser();
    // load palettes, sources:
    //   - https://github.com/ivstiv/pixelart-converter/tree/master/src/main/resources/palettes

    Future<void> dress(String filePalette) async {
      const fileSource = 'colorful_swirl';
      final palette = UniPalette<int>.file(
        'test/data/palettes/$filePalette.json',
        ColorModel.rgb,
      );
      final image =
          await dresser.dressFile(File('test/data/$fileSource.webp'), palette);
      File('$testOutputPath/dresser - some real palettes'
          '/${fileSource}_$filePalette.png')
        ..createSync(recursive: true)
        ..writeAsBytesSync(encodePng(image));
    }

    test('dress all', () async {
      const filesPalettes = [
        'black_rgb_white',
        'black_white',
        'faber_castell_36',
        'grey_0_8',
        'grey_0_128',
        'grey_0_256',
        'sepia',
      ];
      for (final fp in filesPalettes) {
        print('Dressing `$fp`...');
        await dress(fp);
      }
    });
  });
}
