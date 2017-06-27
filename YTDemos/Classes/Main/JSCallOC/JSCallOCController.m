//
//  JSCallOCController.m
//  YTDemos
//
//  Created by caixiasun on 2017/5/25.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "JSCallOCController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface JSCallOCController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) JSContext *context;

@end

@implementation JSCallOCController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[[NSBundle mainBundle] bundlePath]  stringByAppendingPathComponent:@"JSCallOC.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    [self.webView loadRequest:request];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];//隐藏导航上返回按钮的标题
}
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.frame = CGRectMake(0, 64, YTScreenWidth, YTScreenHeight-64);
        _webView.delegate = self;
        [self.view addSubview:_webView];
    }
    return _webView;
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    self.context[@"log"] = ^(NSString *str) {
        NSLog(@"____log__%@",str);
    };
}


@end
