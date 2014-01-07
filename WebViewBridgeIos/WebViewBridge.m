//
//  WebViewBridge.m
//  WebViewBridgeIos
//
//  Created by apple on 2014. 1. 6..
//  Copyright (c) 2014년 b612lodger. All rights reserved.
//

#import "WebViewBridge.h"

@implementation WebViewBridge {
    UIWebView* _webView;
    ServerStub* _serverStub;
}

-(id)init {
    self = [super init];
    _serverStub = [[ServerStub alloc] init];
    return self;
}

-(void)bindWebView:(UIWebView*) webview {
    [webview setDelegate:self];
    _webView = webview;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    //jsonrpc://
    NSString *prefix = @"jsonrpc://";
    NSString *url = request.URL.absoluteString;
    
    NSLog(@"URL %@", url);
    if([url hasPrefix:prefix]) {
        NSLog(@"REQUEST %@", [url componentsSeparatedByString:prefix][1]);
        NSString* response = [_serverStub execute:[url componentsSeparatedByString:prefix][1]];
        [self OnResponse:response];
    }
    return true;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    //Initial JS for Stub module.
//    [_webView stringByEvaluatingJavaScriptFromString:@"var rpcStub=function(){function d(a){void 0!==b[a.id]&&null!==b[a.id]&&(b[a.id].call(e[a.id],a.result),b[a.id]=void 0,e[a.id]=void 0)}var b={},e={};return{request:function(a,d,c,f){for(a={jsonrpc:\"2.0\",method:a,params:d,id:Math.floor(1E6*Math.random())+1};void 0!==b[a.id];)a.id=Math.floor(1E6*Math.random())+1;b[a.id]=c;e[a.id]=f;c=JSON.stringify(a);console.log(c);void 0!==window.jsonRpc?window.jsonRpc.request(c):document.location.href=\"jsonrpc://\"+c},response:function(a){a=\"string\"==typeof a||a instanceof String?JSON.parse(a):a;if(a instanceof Array)for(responseObj in a)d(responseObj);else d(a)},putTestResponse:function(a,b){}}}();"];
}

-(void)OnResponse:(NSString*)response {
    [_webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"rpcStub.response(%@);", response]];
}

-(void)registerMethod:(ServerMethod*)method {
    [_serverStub registerMethod:method];
}

@end
