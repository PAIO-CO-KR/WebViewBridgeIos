//
//  WebViewBridgeIosTests.m
//  WebViewBridgeIosTests
//
//  Created by apple on 2014. 1. 5..
//  Copyright (c) 2014년 b612lodger. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "ServerStub.h"
#import "Request.h"

@interface TestParam : NSObject
@property NSNumber *minuend;
@property NSNumber *subtrahend;
@end
@implementation TestParam

@end



@interface WebViewBridgeIosTests : XCTestCase

@end

@implementation WebViewBridgeIosTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    ServerStub *stub = [[ServerStub alloc] init];
    
    ServerMethod *serverMethod = [[ServerMethod alloc] init:@"subtract" withParamCls:TestParam.class withResultCls:NSNumber.class withMethodBlock:^NSNumber*(TestParam* param) {
        TestParam* p = (TestParam*)param;
        NSLog(@"YES IT IS CALLBACK");
        return [NSNumber numberWithInt:1];
    }];
    [stub registerMethod:serverMethod];
    
    [stub execute:@"{\"jsonrpc\": \"2.0\", \"method\": \"subtract\", \"params\": {\"minuend\": 42, \"subtrahend\": 23}, \"id\": 1}"];
    
}

@end
