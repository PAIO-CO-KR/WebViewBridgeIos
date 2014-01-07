//
//  Request.h
//  WebViewBridgeIos
//
//  Created by apple on 2014. 1. 6..
//  Copyright (c) 2014년 b612lodger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request : NSObject

@property NSString *jsonrpc;

@property NSString *method;

@property NSNumber *id;

@property id params;

@end
