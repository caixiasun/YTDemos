//
//  OtherController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/26.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "OtherController.h"

@interface OtherController ()

@end

@implementation OtherController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self addCell];
}

- (void)addCell {
    [self addCell:@"高斯模糊" ClassName:@"GaussianBlurController"];
    [self addCell:@"字体相关" ClassName:@"FontDemoController"];
    
    [self.tableView reloadData];
}
- (void)setupNavi {
    self.navigationItem.title = @"其它小知识";
}

@end
