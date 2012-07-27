//
//  MVFacebookSessionController.h
//  Movox
//
//  Created by 哲史 深谷 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBiOSSDK/FacebookSDK.h>

typedef void (^SessionStatusBlock)();

@interface MVFacebookSessionController : NSObject
@property (readonly, nonatomic) FBSession *session; 
@property (copy, nonatomic) SessionStatusBlock onSuccess;
@property (copy, nonatomic) SessionStatusBlock onFailure;
+ (MVFacebookSessionController *)sharedObject;
- (BOOL)exist;
- (void)create;
@end
