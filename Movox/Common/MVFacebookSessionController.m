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
        if (!_session.isOpen) {
            _session = [[FBSession alloc] init];
            if (_session.state == FBSessionStateCreatedTokenLoaded) {
                [_session openWithCompletionHandler:^(FBSession *session, FBSessionState status, NSError *error) {

                }];
            }
        }
    }
    return self;
}

- (BOOL)exist{
    if (_session.state == FBSessionStateCreated) {
        return true;
    }
    return false;
}

- (void)create{
    if (!_session || ![self exist]) {
        _session = [[FBSession alloc] init];
    }
    [_session openWithBehavior:FBSessionLoginBehaviorForcingWebView completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
        if (!error) {
            if (self.onSuccess) self.onSuccess();
        }else {
            if (self.onFailure) self.onFailure();
        }
    }];
}

- (void)destroy{
    [_session closeAndClearTokenInformation];
}

- (void)dealloc{
    sharedObject = nil;
}

@end