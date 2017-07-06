//
//  Demo05_GaussianBlurController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/30.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Demo05_GaussianBlurController.h"
#import <UIImageView+LBBlurredImage.h>

@interface Demo05_GaussianBlurController ()
{
    CGFloat _blur;
}

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation Demo05_GaussianBlurController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _blur = 20.0;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [imageView setImageToBlur:[UIImage imageNamed:@"blur_01.jpeg"] blurRadius:_blur completionBlock:nil];
    [self.view addSubview:imageView];
    self.imageView = imageView;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 100, 80, 45);
    btn.tag = 1;
    [btn addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderColor = BlackColor.CGColor;
    btn.layer.borderWidth = 1;
    [btn setTitle:@"加" forState:UIControlStateNormal];
    [btn setTitleColor:BlueColor forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 100, 80, 45);
    btn2.tag = 2;
    [btn2 addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    btn2.layer.borderColor = BlackColor.CGColor;
    btn2.layer.borderWidth = 1;
    [btn2 setTitle:@"恢复" forState:UIControlStateNormal];
    [btn2 setTitleColor:BlueColor forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(190, 100, 80, 45);
    btn3.tag = 3;
    [btn3 addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    btn3.layer.borderColor = BlackColor.CGColor;
    btn3.layer.borderWidth = 1;
    [btn3 setTitle:@"减" forState:UIControlStateNormal];
    [btn3 setTitleColor:BlueColor forState:UIControlStateNormal];
    [self.view addSubview:btn3];
}

- (void)itemAction:(UIButton *)item {
    if (item.tag == 1) {
        _blur += 5.0;
    }else if (item.tag == 3){
        _blur -= 5.0;
    }else {
        _blur = 0.0;
    }
    @weakify(self)
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       [weak_self.imageView setImageToBlur:[UIImage imageNamed:@"blur_01.jpeg"] blurRadius:_blur completionBlock:nil];
    });
}

@end
