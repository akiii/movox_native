//
//  MVFacebookSessionController.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MVFacebookSessionController.h"

static MVFacebookSessionController *sharedObject = nil;

@implementation MVFacebookSessionController
@synthesize session = _session, onSuccess, onFailure;

+ (MVFacebookSessionController *)sharedObject{
    if (!sharedObject) {
        sharedObject = [[self alloc] init];
    }
    return sharedObject;
}

- (id)init{
    if (self = [super init]) {
        _session = [[FBSession alloc] init];
    }
    return self;
}

- (BOOL)exist{
    if (self.session.state == FBSessionStateCreated) {
        return true;
    }
    return false;
}

- (void)create{
    if (!self.session || ![self exist]) {
        _session = [[FBSession alloc] init];
    }
    [self.session openWithBehavior:FBSessionLoginBehaviorForcingWebView completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
        if (!error) {
            if (self.onSuccess) self.onSuccess();
        }else {
            if (self.onFailure) self.onFailure();
        }
    }];
}

- (void)dealloc{
    sharedObject = nil;
}

@end