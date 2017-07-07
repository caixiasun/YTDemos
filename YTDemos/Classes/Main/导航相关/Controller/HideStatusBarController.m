//
//  HideStatusBarController.m
//  YTDemos
//
//  Created by caixiasun on 2017/7/6.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "HideStatusBarController.h"

@interface HideStatusBarController ()
{
    BOOL _isHideStatusBar;
}

@end

@implementation HideStatusBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = WhiteColor;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    1、隐藏、显示
//    [UIApplication sharedApplication].statusBarHidden = YES;
    
//    2、设置字体颜色
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    1、隐藏、显示
//    [UIApplication sharedApplication].statusBarHidden = NO;
    
//    2、设置字体颜色
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

@end
