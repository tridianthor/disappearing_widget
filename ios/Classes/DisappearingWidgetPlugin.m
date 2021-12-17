#import "DisappearingWidgetPlugin.h"
#if __has_include(<disappearing_widget/disappearing_widget-Swift.h>)
#import <disappearing_widget/disappearing_widget-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "disappearing_widget-Swift.h"
#endif

@implementation DisappearingWidgetPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDisappearingWidgetPlugin registerWithRegistrar:registrar];
}
@end
