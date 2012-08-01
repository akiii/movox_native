//
//  MVUser.h
//  Movox
//
//  Created by Akifumi on 2012/07/31.
//
//

#import <Foundation/Foundation.h>

@interface MVFacebookUser : NSObject
@property (strong, nonatomic) NSString *facebookId;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *profileImage;
@end
