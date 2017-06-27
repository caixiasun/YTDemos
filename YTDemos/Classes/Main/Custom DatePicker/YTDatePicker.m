//
//  YTDatePicker.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/21.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "YTDatePicker.h"

@interface YTDatePicker ()
{
    CGFloat _height_backView;
    CGFloat _height_itemsBar;
    CGFloat _height_pickView;
    CGRect _frame_backView;
}

@property (nonatomic, assign) id<YTDatePickerDelegate>delegate;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIPickerView *pickerView;

@end
@implementation YTDatePicker

- (instancetype)initWithDelegate:(id)delegate {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.delegate = delegate;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:.4];
        self.hidden = YES;
        
        [self yt_defaults];
        [self yt_setupUI];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return self;
}
- (void)yt_defaults {
    self.frame = [UIScreen mainScreen].bounds;
    _height_backView = CGRectGetHeight(self.frame)*0.3;
    _height_itemsBar = CGRectGetHeight(self.frame)*0.05;
    
    _frame_backView = CGRectMake(0, CGRectGetHeight(self.frame)-_height_backView, CGRectGetWidth(self.frame), _height_backView);
}
- (void)yt_setupUI {
    
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor whiteColor];
    backView.frame = CGRectMake(0, CGRectGetHeight(self.frame), CGRectGetWidth(self.frame), _height_backView);
    [self addSubview:backView];
    self.backView = backView;
    
    {//itemsBar
        UIView *itemsBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), _height_itemsBar)];
        itemsBar.backgroundColor = [UIColor colorWithWhite:.95 alpha:1];
        [backView addSubview:itemsBar];
        
        
    }
    
    {//pickerView
        UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, _height_itemsBar, CGRectGetWidth(self.frame), _height_backView-_height_itemsBar)];
        [pickerView setShowsSelectionIndicator:YES];
        //            pickerView.delegate = self;
        //            pickerView.dataSource = self;
        pickerView.backgroundColor = [UIColor whiteColor];
        [backView addSubview:pickerView];
        self.pickerView = pickerView;
    }
}

- (void)show {
    if (!self.hidden) {
        return ;
    }
    
    self.hidden = NO;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    [UIView animateWithDuration:.3 animations:^{
        _backView.top = CGRectGetHeight(self.frame)-_height_backView;
    }];
}

- (void)hide {
    self.hidden = YES;
    [self removeFromSuperview];
}

- (void)tapAction {
    [self hide];
    _backView.top = CGRectGetHeight(self.frame);
}

@end
