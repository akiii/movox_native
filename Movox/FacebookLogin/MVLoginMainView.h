//
//  MVLoginMainView.h
//  Movox
//
//  Created by 哲史 深谷 on 12/07/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVBlocks.h"

@interface MVLoginMainView : UIView {

    ActionBlock onLoginButtonPressed;

}
@property (copy, nonatomic) ActionBlock onLoginButtonPressed;
@end
