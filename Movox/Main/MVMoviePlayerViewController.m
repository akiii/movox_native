//
//  MVMoviePlayer.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MVMoviePlayerViewController.h"

@implementation MVMoviePlayerViewController
@synthesize onPressedCancel, onPressedShare;

- (void)rewriteNavigationBarItems{
    UINavigationBar *navigationBar;
    for (UIView *view in [[[[self.moviePlayer.view.subviews objectAtIndex:0] subviews] objectAtIndex:0] subviews]) {
        for (UIView *subview in view.subviews) {
            if ([NSStringFromClass([subview class]) hasSuffix:@"NavigationBar"]) {
                navigationBar = (UINavigationBar *)subview;
            }
        }
    }
    
    UIBarButtonItem *cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    [[navigationBar.items objectAtIndex:0] setLeftBarButtonItem:cancelButtonItem];
    
    UIBarButtonItem *shareButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(share)];
    [[navigationBar.items objectAtIndex:0] setRightBarButtonItem:shareButtonItem];
}

- (void)playWithContentUrl:(NSURL *)url{
    [self.moviePlayer setContentURL:url];
    [self.moviePlayer prepareToPlay];
        
    [[NSNotificationCenter defaultCenter] addObserverForName:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(id sender){
                                                      [[NSNotificationCenter defaultCenter] removeObserver:self];
                                                      [self.moviePlayer pause];
                                                      [self rewriteNavigationBarItems];
                                                  }];
}

- (void)cancel{
    if (self.onPressedCancel) self.onPressedCancel();
}

- (void)share{
    if (self.onPressedShare) self.onPressedShare();
}

@end
