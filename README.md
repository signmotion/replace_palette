# Replace Color Palette

![Cover - Replace Palette](https://raw.githubusercontent.com/signmotion/replace_palette/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/signmotion/replace_palette/master/LICENSE)

Replaces the color palette in an image, respecting the color models.
The easy-to-use and well-tested package.

## Usage

![Source image]((<https://raw.githubusercontent.com/signmotion/replace_palette/master/images/colorful_swirl.webp>)

⬇️

```dart
final palette = UniPalette<int>.file('my_palette.json', ColorModel.rgb);
final image = const Dresser().dressFile(File('my_image.webp'), palette);
File('my_result.png')
  ..createSync(recursive: true)
  ..writeAsBytesSync(encodePng(image));

```

⬇️

### Faber Castell 36 Palette

![Faber Castell 36 Palette - Result image]((<https://raw.githubusercontent.com/signmotion/replace_palette/master/images/colorful_swirl_faber_castell_36.webp>)

### Black and White Palette

![Black and White Palette - Result image]((<https://raw.githubusercontent.com/signmotion/replace_palette/master/images/colorful_swirl_black_white.webp>)

## Welcome

This package is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/replace_palette). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/replace_palette).

## TODO

- Respect the other colour models.
- Example for named colors with [UniColorName package](https://github.com/signmotion/uni_color_name).
