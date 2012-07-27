//
//  MVViewSizeMacro.h
//  Movox
//
//  Created by 哲史 深谷 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#define SizeOfScreen        [UIScreen mainScreen].bounds.size
#define SizeOfStatusBar     [UIApplication sharedApplication].statusBarFrame.size
#define SizeOfNavigationBar CGSizeMake(SizeOfScreen.width, 40)
#define SizeOfTabBar        CGSizeMake(SizeOfScreen.width, 49)
#define SizeOfToolBar       CGSizeMake(SizeOfScreen.width, 49)
