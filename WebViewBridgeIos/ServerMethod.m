//
//  ServerMethod.m
//  WebViewBridgeIos
//
//  Created by apple on 2014. 1. 6..
//  Copyright (c) 2014년 b612lodger. All rights reserved.
//

#import "ServerMethod.h"

@implementation ServerMethod

@synthesize name = _name;

@synthesize paramCls = _paramCls;

@synthesize resultCls = _resultCls;

@synthesize methodBlock = _methodBlock;

-(id)init:(NSString*)name withParamCls:(Class)paramCls withResultCls:(Class)resultCls withMethodBlock:(MethodBlock)methodBlock{
    self = [super init];
    
    [self setName:name];
    [self setParamCls:paramCls];
    [self setResultCls:resultCls];
    [self setMethodBlock:methodBlock];
    
    return self;
}

@end
