#define prefPath [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.coord-e.wrongalert.plist"]

BOOL isEnabled;

%hook SBDeviceLockController

- (BOOL)attemptDeviceUnlockWithPassword:(NSString *)passcode appRequested:(BOOL)requested {

	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:prefPath];

	isEnabled = [[prefs objectForKey:@"enabled"] boolValue];

	if(![[NSFileManager defaultManager] fileExistsAtPath:prefPath])
		isEnabled = YES;

	BOOL isSuccessful = %orig;

	if(isEnabled == YES){
		if(!isSuccessful && passcode != nil){
			id title = [prefs objectForKey:@"title"];
			if(![title length])
				title = @"Wrong!!";
			id textm = [prefs objectForKey:@"text"];
			if(![textm length])
				textm = @"%@ is wrong!";
			id buttonm = [prefs objectForKey:@"button"];
			if(![buttonm length])
				buttonm = @"OK";
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:title, passcode] message:[NSString stringWithFormat:textm, passcode] delegate:nil cancelButtonTitle:[NSString stringWithFormat:buttonm, passcode] otherButtonTitles:nil];
			[alert show];
			[alert release];
		}
	}

	[prefs release];

	return isSuccessful;
}

%end
