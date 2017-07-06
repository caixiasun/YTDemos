//
//  Demo03_GaussianBlurController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/29.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Demo03_GaussianBlurController.h"

@interface Demo03_GaussianBlurController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation Demo03_GaussianBlurController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blur_01.jpeg"]];
    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
    self.imageView = imageView;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.tag = 1;
    btn1.layer.borderColor = BlackColor.CGColor;
    btn1.layer.borderWidth = 1;
    btn1.titleLabel.font = [UIFont systemFontOfSize:13 weight:1];
    [btn1 setTitle:@"ToolBar效果" forState:UIControlStateNormal];
    [btn1 setTitleColor:RedColor forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = 100;
        make.left.offset = 10;
        make.width.offset = 120;
        make.height.offset = 45;
    }];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.tag = 2;
    btn2.layer.borderColor = BlackColor.CGColor;
    btn2.layer.borderWidth = 1;
    btn2.titleLabel.font = btn1.titleLabel.font;
    [btn2 setTitle:@"Blur效果" forState:UIControlStateNormal];
    [btn2 setTitleColor:RedColor forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerY.equalTo(btn1);
        make.right.offset = -10;
    }];
}
- (void)itemAction:(UIButton *)item {
    
    for (UIView *vv in self.imageView.subviews) {
        [vv removeFromSuperview];
    }
    
    if (item.tag == 1) {
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:self.imageView.bounds/*CGRectMake(0, 0, imageView.frame.size.width*0.5, imageView.frame.size.height)*/];
        toolbar.barStyle = UIBarStyleBlack;
        [self.imageView addSubview:toolbar];
    }else {
        static int num = 0;
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:num%6];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.frame = self.imageView.bounds;
        [self.imageView addSubview:effectView];
        num++;
    }
}

@end
