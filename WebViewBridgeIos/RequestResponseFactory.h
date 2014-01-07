//
//  RequestResponseFactory.h
//  WebViewBridgeIos
//
//  Created by apple on 2014. 1. 6..
//  Copyright (c) 2014년 b612lodger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Request.h"
#import "Response.h"
@class ServerStub;

@interface RequestResponseFactory : NSObject

-(id)initWithServerStub:(ServerStub*)serverStub;

-(NSArray*)makeRequest:(NSString*)request;

-(Request*)makeRequestSingle:(NSDictionary*)requestDic;

-(NSString*)serialize:(NSArray*)requests;

-(NSDictionary*)serializeSingle:(Response*)response;

@end
