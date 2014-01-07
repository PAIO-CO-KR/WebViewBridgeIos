//
//  ServerMethod.h
//  WebViewBridgeIos
//
//  Created by apple on 2014. 1. 6..
//  Copyright (c) 2014년 b612lodger. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^MethodBlock)(id param);

@interface ServerMethod : NSObject

@property NSString *name;

@property Class paramCls;

@property Class resultCls;

@property(readwrite, copy) MethodBlock methodBlock;

-(id)init:(NSString*)name withParamCls:(Class)paramCls withResultCls:(Class)resultCls withMethodBlock:(MethodBlock)methodBlock;

@end
