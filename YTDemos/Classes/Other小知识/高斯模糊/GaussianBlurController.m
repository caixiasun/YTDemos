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
    [self addCell:@"CoreImage" ClassName:@"Demo01_GaussianBlurController"];
    
    [self.tableView reloadData];
}

@end
