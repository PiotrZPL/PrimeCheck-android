package de.piotrlange.primecheck

import android.os.Build
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "de.piotrlange.primecheck/dynamic_color"
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "getSystemAccentColor" -> result.success(getSystemAccentColor())
                else -> result.notImplemented()
            }
        }
    }

    private fun getSystemAccentColor(): Int? {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            getColor(android.R.color.system_accent1_600)
        } else {
            null
        }
    }
}
