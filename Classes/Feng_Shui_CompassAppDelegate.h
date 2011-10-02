//
//  Feng_Shui_CompassAppDelegate.h
//  Feng Shui Compass
//
//  Created by Kenneth Anguish on 7/26/09.
//

@class MainViewController;

@interface Feng_Shui_CompassAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mainViewController;

@end

