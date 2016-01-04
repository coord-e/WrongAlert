#import <Preferences/Preferences.h>

@interface WrongAlertListController: PSListController {
}
@end

@implementation WrongAlertListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"WrongAlert" target:self] retain];
	}
	return _specifiers;
}

- (void)github:(id)specifier {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/coord-e/wrongalert/"]];
}
- (void)twitter:(id)specifier {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/coord_e/"]];
}

@end
// vim:ft=objc
