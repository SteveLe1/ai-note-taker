import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:zippy_flutter/utils/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.aFilter).existsSync(), isTrue);
    expect(File(Images.aFilterBlack).existsSync(), isTrue);
    expect(File(Images.bFilter).existsSync(), isTrue);
    expect(File(Images.bFilterBlack).existsSync(), isTrue);
    expect(File(Images.closeFilter).existsSync(), isTrue);
    expect(File(Images.closeFilterBlack).existsSync(), isTrue);
    expect(File(Images.detailEventNotice).existsSync(), isTrue);
    expect(File(Images.faceEmpty).existsSync(), isTrue);
    expect(File(Images.icVip).existsSync(), isTrue);
    expect(File(Images.icZippyLogo).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.minusFilter).existsSync(), isTrue);
    expect(File(Images.onboarding1).existsSync(), isTrue);
    expect(File(Images.onboarding2).existsSync(), isTrue);
    expect(File(Images.onboarding3).existsSync(), isTrue);
    expect(File(Images.onboarding4).existsSync(), isTrue);
    expect(File(Images.onboarding5).existsSync(), isTrue);
    expect(File(Images.report1).existsSync(), isTrue);
    expect(File(Images.sFilter).existsSync(), isTrue);
    expect(File(Images.sFilterBlack).existsSync(), isTrue);
    expect(File(Images.splash).existsSync(), isTrue);
    expect(File(Images.vFilter).existsSync(), isTrue);
    expect(File(Images.valentineSDayBackground).existsSync(), isTrue);
    expect(File(Images.vipFilter).existsSync(), isTrue);
    expect(File(Images.vipFilterBlack).existsSync(), isTrue);
    expect(File(Images.vipFilterWhite).existsSync(), isTrue);
    expect(File(Images.zippyLite).existsSync(), isTrue);
  });
}
