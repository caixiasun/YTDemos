//
//  GoToSettingsController.m
//  YTDemos
//
//  Created by caixiasun on 2017/5/17.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "GoToSettingsController.h"

@interface GoToSettingsController ()

@end

@implementation GoToSettingsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"跳转至设置";
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat itemWidth = YTFitWidth(180);
    CGFloat itemHeight = YTFitHeight(60);
    
    UIButton *button1 = [UIButton new];
    button1.tag = 1;
    [button1 setTitle:@"去设置" forState:UIControlStateNormal];
    [self configuration:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.offset = YTFitHeight(20) + 64;
        make.width.offset = itemWidth;
        make.height.offset = itemHeight;
    }];
}
- (void)configuration:(UIButton *)item {
    [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    item.layer.cornerRadius = 10;
    item.layer.masksToBounds = YES;
    item.backgroundColor = [UIColor blackColor];
    [self.view addSubview:item];
}
- (void)itemAction:(UIButton *)item {
    switch (item.tag) {
        case 1:
        {
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
//            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Wdeprecated-declarations"
            [[UIApplication sharedApplication] openURL:url];
            #pragma clang diagnostic pop
            break;
        }
        default:
        {
            break;
        }
    }
}

@end
