//
//  MVFacebookRequestor.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <FBiOSSDK/FacebookSDK.h>
#import "MVFacebookRequestor.h"
#import "MVFacebookSessionController.h"

static MVFacebookRequestor *shared;

@interface MVFacebookRequestor()
@property (copy, nonatomic) ActionBlock onGotCurrentUser, onGotFriends;
@end

@implementation MVFacebookRequestor
@synthesize currentUser = _currentUser, friends = _friends, onGotCurrentUser, onGotFriends;
@synthesize onFinishedSetup;

+ (MVFacebookRequestor *)sharedObject{
    if (!shared) {
        shared = [[self alloc] init];
    }
    return shared;
}

- (void)setup{
    [[MVFacebookRequestor sharedObject] setCurrentUser];
    
    self.onGotCurrentUser = ^(){
        [[MVFacebookRequestor sharedObject] setFriends];
    };
    
    self.onGotFriends = ^(){
        if (self.onFinishedSetup) self.onFinishedSetup();
    };
}

- (void)setCurrentUser{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"name, picture", @"fields", nil];
    FBRequest *req = [[FBRequest alloc] initWithSession:[MVFacebookSessionController sharedObject].session graphPath:@"me" parameters:params HTTPMethod:@"GET"];
    [req startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            _currentUser = [[MVUser alloc] init];
            _currentUser.facebookId = [result objectForKey:@"id"];
            _currentUser.name = [result objectForKey:@"name"];
            _currentUser.profileImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[[result objectForKey:@"picture"] objectForKey:@"data"] objectForKey:@"url"]]]];
            if (self.onGotCurrentUser) self.onGotCurrentUser();
        }
    }];
}

- (void)setFriends{
    _friends = [NSMutableArray array];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"id, name, picture", @"fields", nil];
    FBRequest *req = [[FBRequest alloc] initWithSession:[MVFacebookSessionController sharedObject].session graphPath:@"me/friends" parameters:params HTTPMethod:@"GET"];
    [req startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            result = [result objectForKey:@"data"];
            for (NSDictionary *fd in result) {
                MVUser *friend = [[MVUser alloc] init];
                friend.facebookId = [fd objectForKey:@"id"];
                friend.name = [fd objectForKey:@"name"];
                friend.profileImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[[fd objectForKey:@"picture"] objectForKey:@"data"] objectForKey:@"url"]]]];
                [self.friends addObject:friend];
                if (self.friends.count == ((NSArray *)result).count) {
                    if (self.onGotFriends) self.onGotFriends();
                }
            }
        }
    }];
}

- (void)dealloc{
    shared = nil;
}

@end
