//
//  MainViewController.m
//  Feng Shui Compass
//
//  Created by Kenneth Anguish on 7/26/09.
//

#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController
@synthesize locationManager;
@synthesize xLabel, yLabel, zLabel, magnitudeLabel;
@synthesize compassView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}



 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
	 [super viewDidLoad];
	 
     // put frame
     self.compassView.frame = CGRectMake(19.0, 98.0, 280.0, 280.0);
     
	 // setup the location manager
	 self.locationManager = [[[CLLocationManager alloc] init] autorelease];
	 
	 // check if the hardware has a compass
	 if (locationManager.headingAvailable == NO) {
		 // No compass is available. This application cannot function without a compass, 
		 // so a dialog will be displayed and no magnetic data will be measured.
		 self.locationManager = nil;
		 UIAlertView *noCompassAlert = [[UIAlertView alloc] initWithTitle:@"No Compass!" message:@"This device does not have the ability to measure magnetic fields." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		 [noCompassAlert show];
		 [noCompassAlert release];
	 } else {
		 // heading service configuration
		 locationManager.headingFilter = kCLHeadingFilterNone;
		 
		 // setup delegate callbacks
		 locationManager.delegate = self;
		 
		 // start the compass
		 [locationManager startUpdatingHeading];
	 }	 
 }



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.xLabel = nil;
    self.yLabel = nil;
    self.zLabel = nil;
}



- (void)dealloc {
	[xLabel release];
	[yLabel release];
	[zLabel release];
	
	// stop the compass
	[locationManager stopUpdatingHeading];
	[locationManager release];
	
    [super dealloc];
}

#pragma mark -
#pragma mark Core Location delegates
// This delegate method is invoked when the location manager has heading data.
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)heading {
    // Update the labels with the raw x, y, and z values.
	[xLabel setText:[NSString stringWithFormat:@"%.1f", heading.x]];
	[yLabel setText:[NSString stringWithFormat:@"%.1f", heading.y]];
	[zLabel setText:[NSString stringWithFormat:@"%.1f", heading.z]];
    
    // Compute and display the magnitude (size or strength) of the vector.
	//      magnitude = sqrt(x^2 + y^2 + z^2)
	CGFloat magnitude = sqrt(heading.x*heading.x + heading.y*heading.y + heading.z*heading.z);
    [magnitudeLabel setText:[NSString stringWithFormat:@"%.1f", magnitude]];
	
	// NSLog(@"Magnetic heading is %f", [heading magneticHeading]);
	// NSLog(@"True heading is %f", [heading trueHeading]);
	
	[self.compassView changeDirection: [heading magneticHeading]];
	
	[directionLabel setText: [NSString stringWithFormat:@"%.f degrees", [heading magneticHeading] ]];
	
	// NSLog(@"--------------");
}

- (IBAction)changeDirection10:(id)sender {
	double newDirection = 10.0;
	[self.compassView changeDirection: newDirection];

}

- (IBAction)changeDirection60:(id)sender {
	double newDirection = 60.0;
	[self.compassView changeDirection: newDirection];
	
}


- (IBAction)changeDirection170:(id)sender {
	double newDirection = 170.0;
	[self.compassView changeDirection: newDirection];
}



- (IBAction)changeDirection280:(id)sender {
	double newDirection = 280.0;
	[self.compassView changeDirection: newDirection];
}

- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager {
	return YES;
}


@end
