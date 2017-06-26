//
//  UIView+YTFrame.h
//  YTSendGiftDemo
//
//  Created by yatou on 2016/12/22.
//  Copyright © 2016年 yatou. All rights reserved.
//

#import <UIKit/UIKit.h>

#define YTScreenWidth [UIScreen mainScreen].bounds.size.width
#define YTScreenHeight [UIScreen mainScreen].bounds.size.height
#define YTFitHeight(value) value * YTScreenHeight / 1334
#define YTFitWidth(value) value * YTScreenWidth / 750
#define YTFontMaxSize(value) YTFitWidth(value*2) >= value ? value : YTFitWidth(value*2)

@interface UIView (YTFrame)

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@end
