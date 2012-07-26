//
//  MVTabBarVIewController.h
//  Movox
//
//  Created by 哲史 深谷 on 12/07/22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MVNavigationController : UINavigationController
+ (MVNavigationController *)navigationControllerWithRootViewController:(UIViewController *)viewController tabBarTitle:(NSString *)title tabBarImageName:(NSString *)imageName tabBarTag:(int)tag;
@end
