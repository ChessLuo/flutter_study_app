package com.chessluo.flutter_study_app;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.PluginRegistry;
/**
 * @描述 Flutter android主页
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019-08-11
 *
 */

public class MainActivity extends FlutterActivity {


  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    registerCustomPlugin(this);
  }

  private void registerCustomPlugin(PluginRegistry registrar) {
    MyMethodChannel.registerWith(registrar.registrarFor(MyMethodChannel.CHANNEL));
  }

}
