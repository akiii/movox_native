//
//  MVRootSecondViewController.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MVRootSecondViewController.h"
#import "MVViewSizeMacro.h"

@interface MVRootSecondViewController ()

@end

@implementation MVRootSecondViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.    
    self.view.frame = CGRectMake(0, 0, SizeOfScreen.width, SizeOfScreen.height);
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:255 alpha:255];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 100, 30);
    label.text = @"second";
    [self.view addSubview:label];
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
