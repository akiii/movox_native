//
//  MVMoviePlayer.h
//  Movox
//
//  Created by 哲史 深谷 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MVBlocks.h"

@interface MVMoviePlayerViewController : MPMoviePlayerViewController {
    ActionBlock onPressedCancel;
    ActionBlock onPressedShare;
}
@property (copy, nonatomic) ActionBlock onPressedCancel;
@property (copy, nonatomic) ActionBlock onPressedShare;
- (void)playWithContentUrl:(NSURL *)url;
@end
