//
//  MVMoviePlayer.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MVMoviePlayerViewController.h"

@implementation MVMoviePlayerViewController
@synthesize onPressedCancel;

- (void)playWithContentUrl:(NSURL *)url{
    [self.moviePlayer setContentURL:url];
    [self.moviePlayer prepareToPlay];
    
    UINavigationBar *navigationBar;
    for (UIView *view in [[[[self.moviePlayer.view.subviews objectAtIndex:0] subviews] objectAtIndex:0] subviews]) {
        for (UIView *subview in view.subviews) {
            NSLog(@"%@", [subview class]);
            if ([NSStringFromClass([subview class]) hasSuffix:@"NavigationBar"]) {
                navigationBar = (UINavigationBar *)subview;
            }
        }
    }
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    [[navigationBar.items objectAtIndex:0] setLeftBarButtonItem:leftButtonItem];
    //        for (UINavigationItem *item in navigationBar.items) {
    //            NSLog(@"item : %@", item);
    //        }
    //        
    //        
    //        NSLog(@"%@", [[[[self.moviePlayer.view.subviews objectAtIndex:0] subviews] objectAtIndex:0] subviews]);
    
    [[NSNotificationCenter defaultCenter] addObserverForName:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(id sender){
                                                      [[NSNotificationCenter defaultCenter] removeObserver:self];
                                                      [self.moviePlayer pause];
                                                  }];
}

- (void)cancel{
    if (self.onPressedCancel) self.onPressedCancel();
}

@end
