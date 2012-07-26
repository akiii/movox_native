//
//  MVRootCameraViewController.h
//  Movox
//
//  Created by 哲史 深谷 on 12/07/26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVBlocks.h"

@interface MVRootCameraViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    ActionBlock onCloseCamera;
}
@property (copy, nonatomic) ActionBlock onCloseCamera;
- (void)showCameraWithAnimation:(BOOL)animation;
@end
