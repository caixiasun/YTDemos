//
//  NaviDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/7.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "NaviDemoController.h"

@interface NaviDemoController ()

@end

@implementation NaviDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self addCell];
}

- (void)addCell {
    [self addCell:@"导航上加 Segment" ClassName:@"Segment_NaviController"];
    [self addCell:@"模态弹出，导航的显示与隐藏" ClassName:@"ModalDemoController"];
    [self addCell:@"状态栏设置" ClassName:@"HideStatusBarController"];
    
    [self.tableView reloadData];
}

@end
