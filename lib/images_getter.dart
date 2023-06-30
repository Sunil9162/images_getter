import 'images_getter_platform_interface.dart';

class ImagesGetter {
  Future<String?> getPlatformVersion() {
    return ImagesGetterPlatform.instance.getPlatformVersion();
  }

  Future<List<Object?>> getImages() {
    return ImagesGetterPlatform.instance.getImages();
  }
}
