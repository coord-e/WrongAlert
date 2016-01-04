#define kSettingsPath [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.coord-e.wrongalert.plist"]

%hook SBDeviceLockController

- (BOOL)attemptDeviceUnlockWithPassword:(NSString *)passcode appRequested:(BOOL)requested {

	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:kSettingsPath];

	BOOL isEnabled = [[prefs objectForKey:@"enabled"] boolValue];

	BOOL isSuccessful = %orig;

	if(isEnabled == YES){
		if(!isSuccessful){
			id title = [prefs objectForKey:@"title"];
			if(![title length])
				title = @"Wrong!!";
			id textm = [prefs objectForKey:@"text"];
			if(![textm length])
				textm = @"%@ is wrong!";
			id buttonm = [prefs objectForKey:@"button"];
			if(![buttonm length])
				buttonm = @"OK";
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:[NSString stringWithFormat:textm, passcode] delegate:nil cancelButtonTitle:buttonm otherButtonTitles:nil];
			[alert show];
			[alert release];
		}
	}

	[prefs release];

	return isSuccessful;
}

%end
