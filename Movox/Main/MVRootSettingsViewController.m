//
//  MVRootSettingsViewController.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MVRootSettingsViewController.h"
#import "MVFacebookSessionController.h"
#import "MVFacebookRequestor.h"
#import "MVViewSizeMacro.h"

@interface MVRootSettingsViewController ()

@end

@implementation MVRootSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIView *mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SizeOfScreen.width, SizeOfScreen.height - SizeOfStatusBar.height - SizeOfNavigationBar.height - SizeOfTabBar.height)];
        [self.view addSubview:mainView];
        
        UIButton *logoutButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        float logoutButtonWidth = mainView.frame.size.width * 0.8;
        float logoutButtonHeight =  mainView.frame.size.height * 0.1;
        logoutButton.frame = CGRectMake(mainView.frame.size.width * 0.1, mainView.frame.size.height/2, logoutButtonWidth, logoutButtonHeight);
        [logoutButton setTitle:@"logout" forState:UIControlStateNormal];
        [logoutButton addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
        [mainView addSubview:logoutButton];
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

- (void)logout{
    [[MVFacebookSessionController sharedObject] destroy];
}

@end
