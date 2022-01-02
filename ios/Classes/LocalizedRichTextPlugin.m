#import "LocalizedRichTextPlugin.h"
#if __has_include(<localized_rich_text/localized_rich_text-Swift.h>)
#import <localized_rich_text/localized_rich_text-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "localized_rich_text-Swift.h"
#endif

@implementation LocalizedRichTextPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLocalizedRichTextPlugin registerWithRegistrar:registrar];
}
@end
