//
//  MVLoginViewControllerViewController.h
//  Movox
//
//  Created by 哲史 深谷 on 12/07/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVBlocks.h"

@interface MVLoginViewController : UIViewController {
    
    ActionBlock onLoginSuccessed;
}
@property (copy, nonatomic) ActionBlock onLoginSuccessed;
@end
