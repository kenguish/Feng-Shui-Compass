//
//  FlipsideViewController.h
//  Feng Shui Compass
//
//  Created by Kenneth Anguish on 7/26/09.
//

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
	UIWebView *webView;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
- (IBAction)done;

@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

