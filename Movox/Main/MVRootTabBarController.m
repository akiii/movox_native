//
//  MVRootTabBarController.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MVRootTabBarController.h"
#import "MVNavigationController.h"

#import "MVRootFriendsViewController.h"
#import "MVRootCameraViewController.h"
#import "MVRootMainViewController.h"
#import "MVRootSecondViewController.h"
#import "MVRootSettingsViewController.h"

typedef enum MVRootTabBarTag {
    MVRootTabBarTagFriends  = 0,
    MVRootTabBarTagMain2    = 1,
    MVRootTabBarTagCamera   = 2,
    MVRootTabBarTagSecond   = 3,
    MVRootTabBarTagSettings = 4
} _MVRootTabBarTag;

@interface MVRootTabBarController()
@property (assign) int preViewControllerTag;
@property (strong, nonatomic) MVRootCameraViewController *cameraViewController;
@end

@implementation MVRootTabBarController
@synthesize preViewControllerTag;
@synthesize cameraViewController;

- (id)init{
    if (self = [super init]) {
        MVNavigationController *friendsNavigationController = [MVNavigationController navigationControllerWithRootViewController:[[MVRootFriendsViewController alloc] initWithNibName:nil bundle:nil] tabBarTitle:@"friends" tabBarImageName:@"friends.png" tabBarTag:MVRootTabBarTagFriends];
        
        MVRootMainViewController *mainViewController2 = [[MVRootMainViewController alloc] initWithNibName:nil bundle:nil];
        mainViewController2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:MVRootTabBarTagMain2];

        self.cameraViewController = [[MVRootCameraViewController alloc] initWithNibName:nil bundle:nil];
        self.cameraViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:MVRootTabBarTagCamera];
        self.cameraViewController.onCloseCamera = ^(){
            self.selectedIndex = self.preViewControllerTag;
        };
        
        MVRootSecondViewController *secondViewController = [[MVRootSecondViewController alloc] initWithNibName:nil bundle:nil];
        secondViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:MVRootTabBarTagSecond];
        
        MVNavigationController *settingsNavigationController = [MVNavigationController navigationControllerWithRootViewController:[[MVRootSettingsViewController alloc] initWithNibName:nil bundle:nil] tabBarTitle:@"settings" tabBarImageName:@"gear.png" tabBarTag:MVRootTabBarTagSettings];
        
        [self setViewControllers:[NSArray arrayWithObjects:friendsNavigationController, mainViewController2, cameraViewController, secondViewController, settingsNavigationController, nil] animated:NO];

        self.preViewControllerTag = MVRootTabBarTagMain2;
        self.selectedIndex = MVRootTabBarTagMain2;
    }
    return self;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if (item.tag == MVRootTabBarTagCamera) {
        [self.cameraViewController showCameraWithAnimation:YES];
    }else {
        self.preViewControllerTag = item.tag;
    }
}

@end
