//
//  ServerStub.m
//  WebViewBridgeIos
//
//  Created by apple on 2014. 1. 6..
//  Copyright (c) 2014년 b612lodger. All rights reserved.
//

#import "ServerStub.h"

@implementation ServerStub {
    NSMutableDictionary* _methodHandlerDic;
    RequestResponseFactory* _factory;
}

-(id)init {
    self = [super init];
    _methodHandlerDic = [[NSMutableDictionary alloc] init];
    _factory = [[RequestResponseFactory alloc] initWithServerStub:self];
    return self;
}

-(NSString*)execute:(NSString*) request {
    NSArray *requestObjs = [_factory makeRequest:request];
    NSMutableArray *responseObjs = [[NSMutableArray alloc] init];
    
    for (Request *req in requestObjs) {
        [responseObjs addObject:[self executeSingle:req]];
    }
    
    return [_factory serialize:responseObjs];
}

-(Response*)executeSingle:(Request*) request {
    
    ServerMethod *method = [_methodHandlerDic valueForKey:request.method];
    id result = method.methodBlock(request.params);
    Response *response = [[Response alloc] init];
    [response setJsonrpc:@"2.0"];
    [response setId:request.id];
    [response setResult:result];
    
    return response;
}

-(void)registerMethod:(ServerMethod*)method {
    if(method.name == nil || method.paramCls == nil || method.resultCls == nil || method.methodBlock == nil) {
        return;
    }
    
    [_methodHandlerDic setValue:method forKey:method.name];
}

-(ServerMethod*)availableMethod:(NSString*)name {
    return _methodHandlerDic[name];
}

@end
