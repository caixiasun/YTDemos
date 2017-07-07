//
//  CustomDatePickerDemo1Controller.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/21.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "CustomDatePickerDemo1Controller.h"

@interface CustomDatePickerDemo1Controller ()

@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation CustomDatePickerDemo1Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createPickerView];
}

- (void)createPickerView {
    self.datePicker = [[UIDatePicker alloc] init];
    _datePicker.backgroundColor = [UIColor whiteColor];
    // 设置只显示中文
    [_datePicker setLocale:[NSLocale localeWithLocaleIdentifier:@"zh-CN"]];
    // 设置只显示日期
    _datePicker.datePickerMode = UIDatePickerModeDate;
    
    // 创建工具条
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    // 设置背景色
    toolBar.barTintColor = [UIColor whiteColor];
    toolBar.frame = CGRectMake(0, 110, YTScreenWidth, 30);
    // 给工具条添加按钮
    UIBarButtonItem *cancleItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    // 设置UIBarButtonSystemItemFixedSpace的宽度
    spaceItem.width = YTScreenWidth - 100;
    UIBarButtonItem *sureItem = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(sure)];
    // 设置字体颜色
    toolBar.tintColor = [UIColor redColor];
    toolBar.items = @[cancleItem, spaceItem, sureItem];
    
    
    [self.view addSubview:toolBar];
    [self.view addSubview:self.datePicker];
    
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.centerX.equalTo(toolBar);
        make.top.equalTo(toolBar.mas_bottom);
        make.height.offset = YTFitHeight(500);
    }];
    
}
/**
 *  点击取消按钮
 */
- (void)cancel {
    
}

/**
 *  点击确定按钮
 */
- (void)sure {
    NSString *date = [NSString stringWithFormat:@"%@", _datePicker.date];
    NSString *birth = [date substringToIndex:10];
    DLog(@"______________%@",birth);
}

@end
