//
//  ServerStubResponse.h
//  WebViewBridgeIos
//
//  Created by apple on 2014. 1. 6..
//  Copyright (c) 2014년 b612lodger. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServerStubResponse <NSObject>

-(void)OnResponse:(NSString*)response;

@end
