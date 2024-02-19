import 'package:image/image.dart';
import 'package:test/test.dart';

//final testOutputPath = '${Directory.systemTemp.createTempSync().path}/output';
const testOutputPath = './test/_output';

void testImageEquals(Image image, Image image2) {
  expect(image2.width, equals(image.width));
  expect(image2.height, equals(image.height));
  expect(image2.numChannels, equals(image.numChannels));
  expect(image2.hasPalette, equals(image.hasPalette));
  final c = image.iterator..moveNext();
  for (var p2 in image2) {
    final p1 = c.current;
    expect(p2, equals(p1));
    c.moveNext();
  }
}
