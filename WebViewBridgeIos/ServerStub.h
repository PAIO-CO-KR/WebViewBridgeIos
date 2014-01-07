//
//  ServerStub.h
//  WebViewBridgeIos
//
//  Created by apple on 2014. 1. 6..
//  Copyright (c) 2014년 b612lodger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerMethod.h"
#import "RequestResponseFactory.h"

@interface ServerStub : NSObject {
    
}

-(NSString*)execute:(NSString*) request;

-(Response*)executeSingle:(Request*) request;

-(void)registerMethod:(ServerMethod*)method;

-(ServerMethod*)availableMethod:(NSString*)name;

@end
