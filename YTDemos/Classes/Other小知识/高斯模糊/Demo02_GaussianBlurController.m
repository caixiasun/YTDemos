//
//  Demo02_GaussianBlurController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/29.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Demo02_GaussianBlurController.h"
#import "GPUImage.h"

@interface Demo02_GaussianBlurController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation Demo02_GaussianBlurController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.layer.borderWidth = 1;
    imageView.layer.borderColor = RedColor.CGColor;
    [self.view addSubview:imageView];
    self.imageView = imageView;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 150, 45);
    btn.center = self.view.center;
    [btn setTitle:@"切换效果" forState:UIControlStateNormal];
    [btn setTitleColor:RedColor forState:UIControlStateNormal];
    btn.layer.borderColor = BlackColor.CGColor;
    btn.layer.borderWidth = 1;
    [btn addTarget:self action:@selector(itemAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)itemAction {
    static CGFloat blur = 0.0;
    blur += 10.0;
    [self blurGPUImageWithNumber:blur];
    
}

- (void)blurGPUImageWithNumber:(CGFloat)blur {
    @weakify(self)
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        GPUImageGaussianBlurFilter *blurFilter = [[GPUImageGaussianBlurFilter alloc] init];
        blurFilter.blurRadiusInPixels = blur;
        dispatch_async(dispatch_get_main_queue(), ^{
            weak_self.imageView.image = [blurFilter imageByFilteringImage:[UIImage imageNamed:@"blur_01.jpeg"]];
        });
    });
}

- (void)didReceiveMemoryWarning {
    NSLog(@"发出内存警告了，注意！注意！！！！");
}

@end
