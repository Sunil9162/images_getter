//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <images_getter/images_getter_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) images_getter_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ImagesGetterPlugin");
  images_getter_plugin_register_with_registrar(images_getter_registrar);
}
