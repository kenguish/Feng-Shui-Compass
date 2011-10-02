//
//  FlipsideViewController.m
//  Feng Shui Compass
//
//  Created by Kenneth Anguish on 7/26/09.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController
@synthesize webView;
@synthesize delegate;



- (void)viewDidLoad {
	[super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];      

	NSString *helpfilepath = [[NSBundle mainBundle] pathForResource:@"helpContent" ofType:@"html"];
	NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:helpfilepath];
	
	NSString *htmlString = [[NSString alloc] initWithData: 
							[readHandle readDataToEndOfFile] encoding:NSUTF8StringEncoding];
	
	
	NSURL *baseURL = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] resourcePath] isDirectory:YES];
	
	// to make html content transparent to its parent view -
	// 1) set the webview's backgroundColor property to [UIColor clearColor]
	// 2) use the content in the html: <body style="background-color: transparent">
	// 3) opaque property set to NO
	//
	webView.opaque = NO;
	webView.backgroundColor = [UIColor clearColor];
	[self.webView loadHTMLString:htmlString baseURL: baseURL];
	[htmlString release];
	
}

- (IBAction)openTianDiWeb:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://tiandiweb.com/iphone/"]]; 
}




- (IBAction)done {
	[self.delegate flipsideViewControllerDidFinish:self];	
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
}


- (void)dealloc {
	[webView release];

    [super dealloc];
}


@end
