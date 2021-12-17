import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:disappearing_widget/disappearing_widget.dart';

void main() {
  const MethodChannel channel = MethodChannel('disappearing_widget');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await DisappearingWidget.platformVersion, '42');
  });
}
