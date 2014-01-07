//
//  RequestResponseFactory.m
//  WebViewBridgeIos
//
//  Created by apple on 2014. 1. 6..
//  Copyright (c) 2014년 b612lodger. All rights reserved.
//

#import "RequestResponseFactory.h"
#import "ServerStub.h"

@implementation RequestResponseFactory {
    ServerStub *_serverStub;
}

-(id)initWithServerStub:(ServerStub*)serverStub {
    self = [super init];
    _serverStub = serverStub;
    return self;
}

-(NSArray*)makeRequest:(NSString*)request {
    NSData *data = [request dataUsingEncoding:NSUTF8StringEncoding];
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSMutableArray *requests = [[NSMutableArray alloc] init];
    
    if([json isKindOfClass:[NSDictionary class]]) {
        [requests addObject:[self makeRequestSingle:json]];
    } else if([json isKindOfClass:[NSArray class]]) {
        for (NSDictionary *req in json) {
            [requests addObject:[self makeRequestSingle:req]];
        }
    }
    
    return [NSArray arrayWithArray:requests];
}

-(Request*)makeRequestSingle:(NSDictionary*)requestDic {
    NSString *method = [requestDic objectForKey:@"method"];
    
    Class paramCls = [[_serverStub availableMethod:method] paramCls];
    id paramObj = [[paramCls alloc] init];
    
    Request *request = [[Request alloc] init];
    request.jsonrpc = [requestDic valueForKey:@"jsonrpc"];
    request.method = method;
    request.id = [requestDic valueForKey:@"id"];
    request.params = paramObj;
    return request;
}

-(NSString*)serialize:(NSArray*)responses {
    if(responses == nil) {
        return nil;
    }
    
    NSString *jsonString = nil;
    if(responses.count > 1) {
        //array.
        NSMutableArray *resArray = [[NSMutableArray alloc] init];
        for (Response *response in responses) {
            [resArray addObject:[self serializeSingle:response]];
        }
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:resArray options:0 error:nil];
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    } else if(responses.count == 1) {
        //json.
        NSDictionary *response = [self serializeSingle:responses[0]];
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:response options:0 error:nil];
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    return jsonString;
}

-(NSDictionary*)serializeSingle:(Response*)response {
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:response.jsonrpc forKey:@"jsonrpc"];
    [dic setValue:response.id forKey:@"id"];
    if(response.result != nil) {
        [dic setValue:response.result forKey:@"result"];
    }
    NSDictionary *responseDic = [NSDictionary dictionaryWithDictionary:dic];
    return responseDic;
}


@end
