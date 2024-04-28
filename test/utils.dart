import 'package:image/image.dart';
import 'package:test/test.dart';

//final testOutputPath = '${Directory.systemTemp.createTempSync().path}/output';
const testOutputPath = './_output';

void testImageEquals(Image a, Image b) {
  expect(b.width, equals(a.width));
  expect(b.height, equals(a.height));
  expect(b.numChannels, equals(a.numChannels));
  expect(b.hasPalette, equals(a.hasPalette));
  final c = a.iterator..moveNext();
  for (final pb in b) {
    final pa = c.current;
    expect(pb, equals(pa));
    c.moveNext();
  }
}
