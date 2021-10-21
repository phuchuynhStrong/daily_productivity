import 'dart:io';

import 'package:daily_productivity/resources/resources.dart';
import 'package:test/test.dart';

void main() {
  test('images assets test', () {
    expect(true, File(Images.ballons).existsSync());
    expect(true, File(Images.blueBook).existsSync());
  });
}
