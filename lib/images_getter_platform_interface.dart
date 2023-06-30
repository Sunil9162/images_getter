import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'images_getter_method_channel.dart';

abstract class ImagesGetterPlatform extends PlatformInterface {
  /// Constructs a ImagesGetterPlatform.
  ImagesGetterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ImagesGetterPlatform _instance = MethodChannelImagesGetter();

  /// The default instance of [ImagesGetterPlatform] to use.
  ///
  /// Defaults to [MethodChannelImagesGetter].
  static ImagesGetterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ImagesGetterPlatform] when
  /// they register themselves.
  static set instance(ImagesGetterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<List<Object?>> getImages() {
    throw UnimplementedError('getImages() has not been implemented.');
  }
}
