//
//  CompassSpatialView.m
//  Feng Shui Compass
//
//  Created by Kenneth Anguish on 7/26/09.
//

#import "CompassSpatialView.h"


@implementation CompassSpatialView


#pragma mark Object Init / Maintenance

- (id)initWithCoder:(NSCoder *)coder
{
	if (self = [super initWithCoder:coder]) {
		[self initializeContents];
	}
	return self;
}

- (void)dealloc
{
	CGImageRelease(_compassImage);
	
	[super dealloc];
}

- (void)awakeFromNib
{	
	// We want to register as an observer for the oalPlayback environment, so we'll get notified when things 
	// change, i.e. source position, listener position.
	// [self layoutContents];
}

#pragma mark View contents

- (void)initializeContents
{
	_compassImage = [[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"compass_new" ofType:@"png"]] CGImage];
	CGImageRetain(_compassImage);
	
	// Set up the CALayer which shows the speaker
	_compassLayer = [CALayer layer];
	_compassLayer.frame = CGRectMake(0., 0., CGImageGetWidth(_compassImage), CGImageGetHeight(_compassImage));
	_compassLayer.contents = (id)_compassImage;
	
	
	
	// Add our sublayers
	[self.layer insertSublayer:_compassLayer above:self.layer];
	
	// Prevent things from drawing outside our layer bounds
	self.layer.masksToBounds = YES;	
	olddirection = 0;
}

- (void)changeDirection:(double)newDirection {
	// double diff = newDirection - olddirection;
	
	_compassLayer.transform = CATransform3DMakeRotation( (360.0 - newDirection) * M_PI / 180.0,  0., 0., 1.);
	olddirection = newDirection;
	
	// NSLog( @"Trigger new direction %f", newDirection);
}

@end
