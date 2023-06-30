#include "include/images_getter/images_getter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "images_getter_plugin.h"

void ImagesGetterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  images_getter::ImagesGetterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
