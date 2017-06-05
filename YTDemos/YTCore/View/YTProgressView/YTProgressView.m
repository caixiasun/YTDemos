//
//  YTProgressView.m
//  NSAttributedStringDemo
//
//  Created by caixiasun on 16/10/11.
//  Copyright © 2016年 CaixiaSun. All rights reserved.
//

#import "YTProgressView.h"

@interface YTProgressView()

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *progressView;


@end

@implementation YTProgressView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.backView];
        [self addSubview:self.progressView];
    }
    return self;
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        _backView.backgroundColor = [UIColor colorWithRed:20 green:26 blue:37 alpha:1];
        _backView.layer.cornerRadius = _backView.frame.size.height * 0.5;
        _backView.layer.masksToBounds = true;
    }
    return _backView;
}

- (UIView *)progressView {
    if (!_progressView) {
        _progressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGRectGetHeight(self.frame))];
        _progressView.backgroundColor = [UIColor colorWithRed:52 green:248 blue:255 alpha:1];
        _progressView.layer.cornerRadius = _progressView.frame.size.height * 0.5;
        _progressView.layer.masksToBounds = true;
    }
    return _progressView;
}

- (void)setTintColor:(UIColor *)tintColor {
    self.backView.backgroundColor = tintColor;
}

- (void)setProgressTintColor:(UIColor *)progressTintColor {
    self.progressView.backgroundColor = progressTintColor;
}

- (void)setProgress:(CGFloat)progress {
    
    CGRect frame = self.progressView.frame;
    frame.size.width = progress * self.frame.size.width;
    
    [UIView animateWithDuration:.3 animations:^{
        self.progressView.frame = frame;
    }];
    
    
}

@end
