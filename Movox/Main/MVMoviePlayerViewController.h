//
//  MVMoviePlayer.h
//  Movox
//
//  Created by 哲史 深谷 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

typedef void (^ToolBarButtonPressedBlock)();

@interface MVMoviePlayerViewController : MPMoviePlayerViewController {
    ToolBarButtonPressedBlock onPressedCancel;
    ToolBarButtonPressedBlock onPressedShare;
}
@property (copy, nonatomic) ToolBarButtonPressedBlock onPressedCancel;
@property (copy, nonatomic) ToolBarButtonPressedBlock onPressedShare;
- (void)playWithContentUrl:(NSURL *)url;
@end
