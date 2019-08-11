package com.chessluo.flutter_study_app;

import android.app.Activity;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * @author ChessLuo
 * @描述 flutter channel Android通道交互
 * @email superluo666@gmail.com
 * @date 2019-08-11
 */
public class MyMethodChannel implements MethodChannel.MethodCallHandler {


    public static String CHANNEL = "flutter_study_app";

    static MethodChannel mMethodChannel;

    private PluginRegistry.Registrar mRegistrar;
    private Activity mActivity;

    private MyMethodChannel(PluginRegistry.Registrar registrar) {
        mRegistrar = registrar;
        mActivity = registrar.activity();
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        mMethodChannel = new MethodChannel(registrar.messenger(), CHANNEL);
        MyMethodChannel instance = new MyMethodChannel(registrar);
        //setMethodCallHandler在此通道上接收方法调用的回调
        mMethodChannel.setMethodCallHandler(instance);
    }


    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call.method.equals("getBatteryLevel")) {
            int batteryLevel = getBatteryLevel();

            if (batteryLevel != -1) {
                result.success(batteryLevel);
            } else {
                result.error("UNAVAILABLE", "Battery level not available.", null);
            }
        } else {
            result.notImplemented();
        }
    }



    /**获取电量*/
    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) mRegistrar.context().getSystemService(mRegistrar.context().BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(mRegistrar.context()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
    }

}
