//
//  MovoxAppDelegate.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MovoxAppDelegate.h"
#import "MVLoginViewController.h"
#import "MVIndicatorViewController.h"
#import "MVFacebookSessionController.h"
#import "MVFacebookRequestor.h"

@implementation MovoxAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    // attempt to extract a token from the url
    return [[MVFacebookSessionController sharedObject].session handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    if ([[MVFacebookSessionController sharedObject] exist]) {
        MVLoginViewController *loginViewController = [[MVLoginViewController alloc] initWithNibName:nil bundle:nil];        
        [self.window addSubview:loginViewController.view];
        
        loginViewController.onLoginSuccessed = ^(){
            
            MVIndicatorViewController *indicatorViewController = [[MVIndicatorViewController alloc] initWithNibName:nil bundle:nil];
            [self.window addSubview:indicatorViewController.view];
            
            MVFacebookRequestor *requestor = [MVFacebookRequestor sharedObject];
            [requestor setup];
            
            requestor.onFinishedSetup = ^(){
                [loginViewController.view removeFromSuperview];
                [indicatorViewController.view removeFromSuperview];
                
                if (self.tabBarController) self.tabBarController = nil;
                _tabBarController = [[MVRootTabBarController alloc] init];
                [self.window addSubview:_tabBarController.view];
            };            
        };
    }else {
        MVIndicatorViewController *indicatorViewController = [[MVIndicatorViewController alloc] initWithNibName:nil bundle:nil];
        [self.window addSubview:indicatorViewController.view];
        
        MVFacebookRequestor *requestor = [MVFacebookRequestor sharedObject];
        [requestor setup];
        
        requestor.onFinishedSetup = ^(){
            [indicatorViewController.view removeFromSuperview];
            
            if (self.tabBarController) self.tabBarController = nil;
            _tabBarController = [[MVRootTabBarController alloc] init];
            [self.window addSubview:_tabBarController.view];
        };
    }
    return YES;
}

@end