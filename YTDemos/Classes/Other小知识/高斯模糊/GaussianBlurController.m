//
//  GaussianBlurController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/27.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "GaussianBlurController.h"

@interface GaussianBlurController ()

@end

@implementation GaussianBlurController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self addCell];
}

- (void)addCell {
    [self addCell:@"vImage" ClassName:@"Demo01_GaussianBlurController"];
    [self addCell:@"GPUImage" ClassName:@"Demo02_GaussianBlurController"];
    [self addCell:@"毛玻璃效果" ClassName:@"Demo03_GaussianBlurController"];
    [self addCell:@"FXBlurView" ClassName:@"Demo04_GaussianBlurController"];
    [self addCell:@"LBBlurredImage" ClassName:@"Demo05_GaussianBlurController"];
    
    [self.tableView reloadData];
}

@end
