part of '../replace_palette.dart';

/// Dresses a new color palette on the image.
class Dresser {
  /// TODO(sign): Choice the color model.
  const Dresser({this.distance = const RgbColorSquareDistance<int>()});

  final ColorDistance distance;

  /// Replaces all colors in the [source] with the nearest colors
  /// from the [palette].
  Image dress(Image source, UniPalette<int> palette) {
    final cache = <int, UniColor<int>>{};
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
      }
    }

    return source;
  }

  /// Replaces all colors in the [source] with the nearest colors
  /// from the [palette].
  Image dressBytes(Uint8List source, UniPalette<int> palette) =>
      dress(decodeImage(source)!, palette);

  /// Replaces all colors in the [source] with the nearest colors
  /// from the [palette].
  Image dressFile(File source, UniPalette<int> palette) =>
      dressBytes(source.readAsBytesSync(), palette);
}
