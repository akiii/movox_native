//
//  MVFacebookRequestor.h
//  Movox
//
//  Created by 哲史 深谷 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVFacebookUser.h"

typedef void (^ActionBlock)();

@interface MVFacebookRequestor : NSObject {
    ActionBlock onFinishedSetup;
}
@property (readonly) MVFacebookUser *currentUser;
@property (readonly) NSMutableArray *friends;
@property (copy, nonatomic) ActionBlock onFinishedSetup;
+ (MVFacebookRequestor *)sharedObject;
- (void)setup;
@end
