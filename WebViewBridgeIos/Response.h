//
//  Response.h
//  WebViewBridgeIos
//
//  Created by apple on 2014. 1. 6..
//  Copyright (c) 2014년 b612lodger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseError.h"

@interface Response : NSObject

@property NSString *jsonrpc;

@property NSDictionary *error;

@property NSNumber *id;

@property id result;

@end
