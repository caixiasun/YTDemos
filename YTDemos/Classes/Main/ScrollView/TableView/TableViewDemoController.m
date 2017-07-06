//
//  TableViewDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/30.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "TableViewDemoController.h"

@interface TableViewDemoController ()

@end

@implementation TableViewDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self addCell];
}

- (void)addCell {
    [self addCell:@"系统提供的Cell自适应高度" ClassName:@"Demo01_TableVIewDemoController"];
}

@end
