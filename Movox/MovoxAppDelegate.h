//
//  MovoxAppDelegate.h
//  Movox
//
//  Created by 哲史 深谷 on 12/07/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVRootTabBarController.h"

@interface MovoxAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MVRootTabBarController *tabBarController;
@end
