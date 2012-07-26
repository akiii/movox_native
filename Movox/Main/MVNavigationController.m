//
//  MVTabBarVIewController.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MVNavigationController.h"
#import "MVViewSizeMacro.h"

@implementation MVNavigationController

+ (MVNavigationController *)navigationControllerWithRootViewController:(UIViewController *)viewController
                                                           tabBarTitle:(NSString *)title
                                                       tabBarImageName:(NSString *)imageName
                                                             tabBarTag:(int)tag{
    MVNavigationController *navigationController = [[MVNavigationController alloc] initWithRootViewController:viewController];
    navigationController.navigationBar.frame = CGRectMake(0, 0, SizeOfNavigationBar.width, SizeOfNavigationBar.height);
    viewController.navigationItem.title = title;
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imageName] tag:tag];
    return navigationController;
}

@end
