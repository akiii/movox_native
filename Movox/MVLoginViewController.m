//
//  MVLoginViewControllerViewController.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <FBiOSSDK/FacebookSDK.h>

#import "MVLoginViewController.h"
#import "MVLoginMainView.h"


@interface MVLoginViewController ()

@end

@implementation MVLoginViewController
@synthesize onLoginSuccessed;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        MVLoginMainView *mainView = [[MVLoginMainView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.view = mainView;
        
        mainView.onLoginButtonPressed = ^(){
            if (![FBSession activeSession] || [FBSession activeSession].state != FBSessionStateCreated) {
                [FBSession setActiveSession:[[FBSession alloc] init]];
            }
            [[FBSession activeSession] openWithBehavior:FBSessionLoginBehaviorForcingWebView completionHandler:^(FBSession *session,FBSessionState status, NSError *error) {
                if (!error) {
                    if (self.onLoginSuccessed)
                        self.onLoginSuccessed();
                }
            }];
        };

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
