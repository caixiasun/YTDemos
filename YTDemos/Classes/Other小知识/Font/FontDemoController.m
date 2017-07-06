//
//  FontDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/30.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "FontDemoController.h"

@interface FontDemoController ()

@end

@implementation FontDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self addCell];
}
- (void)addCell {
    [self addCell:@"系统字体" ClassName:@"Demo01_FontDemoController"];
    
    [self.tableView reloadData];
}

@end
