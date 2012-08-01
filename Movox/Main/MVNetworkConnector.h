//
//  MVNetworkConnector.h
//  Movox
//
//  Created by 哲史 深谷 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	RequestMethodGet,
	RequestMethodPost
} MVNetworkConnectorRequestMethod;

typedef void (^ActionBlock)();

@interface MVNetworkConnector : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate> {

}
@property (readonly) long long expectedContentLength;
@property (readonly) NSMutableData *receivedData;
@property (copy, nonatomic) ActionBlock onFinished;
- (void)openUrl:(NSString*)urlString;
- (void)openUrl:(NSString*)urlString method:(MVNetworkConnectorRequestMethod)method params:(NSString*)params;
@end
