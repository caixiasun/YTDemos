//
//  CustomDatePickerDemo2Controller.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/21.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "CustomDatePickerDemo2Controller.h"
#import "YTDatePicker.h"

@interface CustomDatePickerDemo2Controller ()

@property (nonatomic, strong) YTDatePicker *datePicker;

@end

@implementation CustomDatePickerDemo2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton new];
    btn.bounds = CGRectMake(0, 0, 150, 40);
    btn.center = self.view.center;
    [btn setTitle:@"显示" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    btn.layer.borderWidth = .5;
    [btn addTarget:self action:@selector(itemAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)itemAction {
    [self.datePicker show];
}
- (YTDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[YTDatePicker alloc] initWithDelegate:self];
    }
    return _datePicker;
}

@end
