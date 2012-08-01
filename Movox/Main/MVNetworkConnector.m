//
//  MVNetworkConnector.m
//  Movox
//
//  Created by 哲史 深谷 on 12/07/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MVNetworkConnector.h"

@implementation MVNetworkConnector
@synthesize expectedContentLength = _expectedContentLength;
@synthesize receivedData = _receivedData;
@synthesize onFinished;

- (void)openUrl:(NSString*)urlString{
	[self openUrl:urlString method:RequestMethodGet params:@""];
}

- (void)openUrl:(NSString*)urlString method:(MVNetworkConnectorRequestMethod)method params:(NSString*)params{
    if (_receivedData) _receivedData = nil;
    _receivedData = [[NSMutableData alloc] init];
    
    NSMutableURLRequest *req;
    switch (method) {
        case RequestMethodPost:
            req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
            [req setHTTPMethod:@"POST"];
            [req setHTTPBody:[params dataUsingEncoding:NSShiftJISStringEncoding]];
            break;

        default: {
            NSString *paramsAppendedUrlString;
			if (params != nil && [params length] > 0) {
				paramsAppendedUrlString = [NSString stringWithFormat:@"%@/%@", urlString, params];
			}else{
				paramsAppendedUrlString = urlString;
			}
            NSLog(@"url str : %@", paramsAppendedUrlString);
			req = [NSURLRequest requestWithURL:[NSURL URLWithString:paramsAppendedUrlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
            break;
        }
    }
    
    NSLog(@"req : %@", req);
    [NSURLConnection connectionWithRequest:req delegate:self];
}

/* NSURLConnectionDelegate */
- (BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection{
    NSLog(@"connection : %@", connection);
    return true;
}

- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    NSLog(@"connection : %@", connection);
}

/* NSURLConnectionDataDelegate */
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"connection start");
    _expectedContentLength = response.expectedContentLength;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_receivedData appendData:data];
    NSLog(@" %f %% done", 100.0 * _receivedData.length / _expectedContentLength);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if (self.onFinished) self.onFinished();
}

/*
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection;
- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;

// Deprecated authentication delegates.
- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace;
- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge;
*/

/*
- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;

- (NSInputStream *)connection:(NSURLConnection *)connection needNewBodyStream:(NSURLRequest *)request;
- (void)connection:(NSURLConnection *)connection   didSendBodyData:(NSInteger)bytesWritten
 totalBytesWritten:(NSInteger)totalBytesWritten
totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite;

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse;

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
*/

@end
