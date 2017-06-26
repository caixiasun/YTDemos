//
//  CustomDatePickerDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/20.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "CustomDatePickerDemoController.h"

@interface CustomDatePickerDemoController ()

@end

@implementation CustomDatePickerDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self addCell];
}

- (void)addCell {
    [self addCell:@"系统DatePicker" ClassName:@"CustomDatePickerDemo1Controller"];
    [self addCell:@"使用PickerView" ClassName:@"CustomDatePickerDemo2Controller"];
    
    [self.tableView reloadData];
}


@end
