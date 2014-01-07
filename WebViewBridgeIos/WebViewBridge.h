//
//  WebViewBridge.h
//  WebViewBridgeIos
//
//  Created by apple on 2014. 1. 6..
//  Copyright (c) 2014년 b612lodger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIWebView.h>
#import "ServerStub.h"
#import "ServerStubResponse.h"

@interface WebViewBridge : NSObject<UIWebViewDelegate, ServerStubResponse>

-(id)init;

-(void)bindWebView:(UIWebView*) webview;

-(void)registerMethod:(ServerMethod*)method;

@end
