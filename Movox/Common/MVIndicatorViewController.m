//
//  MVIndicatorViewController.m
//  Movox
//
//  Created by Akifumi on 2012/07/31.
//
//

#import "MVIndicatorViewController.h"
#import "MVViewSizeMacro.h"

@interface MVIndicatorViewController ()

@end

@implementation MVIndicatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor blackColor];
        
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        indicatorView.center = self.view.center;
        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [self.view addSubview:indicatorView];
        [indicatorView startAnimating];
//        UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SizeOfScreen.width, SizeOfScreen.height)];
//        [self.view addSubview:blackView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
