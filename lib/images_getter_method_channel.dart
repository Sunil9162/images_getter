import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'images_getter_platform_interface.dart';

/// An implementation of [ImagesGetterPlatform] that uses method channels.
class MethodChannelImagesGetter extends ImagesGetterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('images_getter');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<List<Object?>> getImages() async {
    final images = await methodChannel.invokeMethod('getImages');
    return images;
  }
}
