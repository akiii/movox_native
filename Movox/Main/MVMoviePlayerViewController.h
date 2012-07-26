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
}
@property (copy, nonatomic) ActionBlock onPressedCancel;
- (void)playWithContentUrl:(NSURL *)url;
@end
