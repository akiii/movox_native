//
//  MVRUser.h
//  Movox
//
//  Created by Akifumi on 2012/08/01.
//
//

#import <Foundation/Foundation.h>
#import "NSRails.h"

@interface MVRUser : NSRRemoteObject
@property (strong, nonatomic) NSString *facebookId;
@property (strong, nonatomic) NSDate *createdAt;
@end
