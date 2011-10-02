//
//  Feng_Shui_CompassAppDelegate.m
//  Feng Shui Compass
//
//  Created by Kenneth Anguish on 7/26/09.
//

#import "Feng_Shui_CompassAppDelegate.h"
#import "MainViewController.h"

@implementation Feng_Shui_CompassAppDelegate


@synthesize window;
@synthesize mainViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
