import Flutter
import UIKit

public class SwiftLocalizedRichTextPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "localized_rich_text", binaryMessenger: registrar.messenger())
    let instance = SwiftLocalizedRichTextPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
