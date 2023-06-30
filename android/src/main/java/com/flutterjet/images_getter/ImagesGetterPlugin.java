package com.flutterjet.images_getter;

import android.annotation.SuppressLint;
import android.content.Context;
import android.database.Cursor;
import android.provider.MediaStore;

import androidx.annotation.NonNull;

import java.util.ArrayList;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** ImagesGetterPlugin */
public class ImagesGetterPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  @SuppressLint("StaticFieldLeak")
  private static Context context;
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "images_getter");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("getImages")) {
      ArrayList<String> images = fetchGalleryImages();
      result.success(images);
    } else {
      result.notImplemented();
    }
  }

  public static ArrayList<String> fetchGalleryImages() {
    ArrayList<String> galleryImageUrls;
    final String[] columns = {MediaStore.Images.Media.DATA, MediaStore.Images.Media._ID};//get all columns of type images
    final String orderBy = MediaStore.Images.Media.DATE_TAKEN;//order data by date

    Cursor imagecursor = context.getContentResolver().query(
            MediaStore.Images.Media.EXTERNAL_CONTENT_URI, columns, null,
            null, orderBy + " DESC");//get all data in Cursor by sorting in DESC order

    galleryImageUrls = new ArrayList<String>();

    for (imagecursor.moveToFirst(); !imagecursor.isAfterLast(); imagecursor.moveToNext()) {
      int dataColumnIndex = imagecursor.getColumnIndex(MediaStore.Images.Media.DATA);//get column index
      galleryImageUrls.add(imagecursor.getString(dataColumnIndex));//get Image from column index
    }
    return galleryImageUrls;
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
