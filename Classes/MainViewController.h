//
//  MainViewController.h
//  Feng Shui Compass
//
//  Created by Kenneth Anguish on 7/26/09.
//

#import "FlipsideViewController.h"
#import <CoreLocation/CoreLocation.h>

#import "CompassSpatialView.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, CLLocationManagerDelegate> {
	IBOutlet UILabel *xLabel;
	IBOutlet UILabel *yLabel;
	IBOutlet UILabel *zLabel;
	IBOutlet UILabel *magnitudeLabel;
	IBOutlet UILabel *directionLabel;

	CLLocationManager *locationManager;
	
	IBOutlet CompassSpatialView *compassView;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) IBOutlet UILabel *xLabel;
@property (nonatomic, retain) IBOutlet UILabel *yLabel;
@property (nonatomic, retain) IBOutlet UILabel *zLabel;
@property (nonatomic, retain) IBOutlet UILabel *magnitudeLabel;
@property (nonatomic, retain) IBOutlet CompassSpatialView *compassView;

- (IBAction)showInfo;

- (IBAction)changeDirection10:(id)sender;
- (IBAction)changeDirection60:(id)sender;
- (IBAction)changeDirection170:(id)sender;
- (IBAction)changeDirection280:(id)sender;

@end
