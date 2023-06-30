package com.flutterjet.images_getter_example;

import androidx.annotation.NonNull;

import com.flutterjet.images_getter.ImagesGetterPlugin;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        // new ImagesGetterPlugin(getApplicationContext());
    }
}
