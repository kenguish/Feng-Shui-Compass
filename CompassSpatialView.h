//
//  CompassSpatialView.h
//  Feng Shui Compass
//
//  Created by Kenneth Anguish on 7/26/09.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#define kTouchDistanceThreshhold 45.

// A function to bring an outlying point into the bounds of a rectangle,
// so that it is as close as possible to its original outlying position.
static inline CGPoint CGPointWithinBounds(CGPoint point, CGRect bounds)
{
	CGPoint ret = point;
	if (ret.x < CGRectGetMinX(bounds)) ret.x = CGRectGetMinX(bounds);
	else if (ret.x > CGRectGetMaxX(bounds)) ret.x = CGRectGetMaxX(bounds);
	if (ret.y < CGRectGetMinY(bounds)) ret.y = CGRectGetMinY(bounds);
	else if (ret.y > CGRectGetMaxY(bounds)) ret.y = CGRectGetMaxY(bounds);
	return ret;
}

@interface CompassSpatialView : UIView {
	// Images for the speaker in its on and off state
	CGImageRef					_compassImage;
	
	CALayer						*_compassLayer;
	double	olddirection;
}

- (void)initializeContents;
- (void)changeDirection:(double)newDirection;

@end
