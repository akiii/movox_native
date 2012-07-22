//
//  MVRootTabBarController.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MVRootTabBarController.h"

@implementation MVRootTabBarController

- (id)init{
    if (self = [super init]) {
        MVRootMainViewController *mainViewController = [[MVRootMainViewController alloc] initWithNibName:nil bundle:nil];
        mainViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:0];
        
        MVRootSecondViewController *secondViewController = [[MVRootSecondViewController alloc] initWithNibName:nil bundle:nil];
        secondViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:1];
        
        [self setViewControllers:[NSArray arrayWithObjects:mainViewController, secondViewController, nil] animated:NO];
    }
    return self;
}

@end
