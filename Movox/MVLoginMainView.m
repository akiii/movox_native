//
//  MVLoginMainView.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MVLoginMainView.h"

@implementation MVLoginMainView
@synthesize onLoginButtonPressed;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        float loginButtonWidth = frame.size.width * 0.8;
        float loginButtonHeight =  frame.size.height * 0.1;
        loginButton.frame = CGRectMake( frame.size.width * 0.1,  frame.size.height * 0.8, loginButtonWidth, loginButtonHeight);
        [loginButton setTitle:@"login" forState:UIControlStateNormal];
        [loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:loginButton];
    }
    return self;
}

- (IBAction)login:(UIButton *)sender{
    if (self.onLoginButtonPressed)
        self.onLoginButtonPressed();
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
