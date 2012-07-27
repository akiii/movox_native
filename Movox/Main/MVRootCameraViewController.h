//
//  MVRootCameraViewController.h
//  Movox
//
//  Created by 哲史 深谷 on 12/07/26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonPressedBlock)();

@interface MVRootCameraViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    ButtonPressedBlock onCloseCamera;
}
@property (copy, nonatomic) ButtonPressedBlock onCloseCamera;
- (void)showCameraWithAnimation:(BOOL)animation;
@end
