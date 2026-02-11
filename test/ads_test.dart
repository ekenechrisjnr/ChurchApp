import 'package:flutter_test/flutter_test.dart';
import 'package:dlcf_radio/ads.dart';

void main() {
  test('Ads class structure check', () {
    // In a test environment, Platform.isAndroid and Platform.isIOS are false.
    // So accessing Ads.bannerAdUnitId should throw UnsupportedError.
    expect(() => Ads.bannerAdUnitId, throwsUnsupportedError);
  });
}
