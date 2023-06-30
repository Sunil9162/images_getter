import 'package:flutter_test/flutter_test.dart';
import 'package:images_getter/images_getter.dart';
import 'package:images_getter/images_getter_method_channel.dart';
import 'package:images_getter/images_getter_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockImagesGetterPlatform
    with MockPlatformInterfaceMixin
    implements ImagesGetterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<List<Object?>> getImages() {
    // TODO: implement getImages
    throw UnimplementedError();
  }
}

void main() {
  final ImagesGetterPlatform initialPlatform = ImagesGetterPlatform.instance;

  test('$MethodChannelImagesGetter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelImagesGetter>());
  });

  test('getPlatformVersion', () async {
    ImagesGetter imagesGetterPlugin = ImagesGetter();
    MockImagesGetterPlatform fakePlatform = MockImagesGetterPlatform();
    ImagesGetterPlatform.instance = fakePlatform;

    expect(await imagesGetterPlugin.getPlatformVersion(), '42');
  });
}
