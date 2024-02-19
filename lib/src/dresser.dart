part of '../replace_palette.dart';

/// Dresses a new color palette on the image.
class Dresser {
  /// TODO(sign): Choice the color model.
  const Dresser({this.distance = const RgbColorSquareDistance<int>()});

  final ColorDistance distance;

  /// Replaces all colors in the [source] with the nearest colors
  /// from the [palette].
  Future<Image> dress(Image source, UniPalette<int> palette) async {
    final cache = <int, UniColor<int>>{};
    var i = 0;
    for (final frame in source.frames) {
      for (final p in frame) {
        final color = (ColorModel.rgb, p.r.toInt(), p.g.toInt(), p.b.toInt());
        final c = cache.update(
          color.i256,
          (v) => v,
          ifAbsent: () => palette.closest(color, distance).$2,
        );
        p
          ..r = c.red
          ..g = c.green
          ..b = c.blue;

        // to release the UI
        ++i;
        if (i % 60 == 0) {
          await Future<dynamic>.delayed(const Duration(microseconds: 0));
        }
      }
    }

    return source;
  }

  /// Replaces all colors in the [source] with the nearest colors
  /// from the [palette].
  Future<Image> dressBytes(Uint8List source, UniPalette<int> palette) async =>
      dress(decodeImage(source)!, palette);

  /// Replaces all colors in the [source] with the nearest colors
  /// from the [palette].
  Future<Image> dressFile(File source, UniPalette<int> palette) async =>
      dressBytes(source.readAsBytesSync(), palette);
}
