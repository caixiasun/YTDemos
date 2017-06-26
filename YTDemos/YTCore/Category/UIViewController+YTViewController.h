//
//  UIViewController+YTViewController.h
//  YTDemos
//
//  Created by caixiasun on 2017/6/13.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (YTViewController)

@property (nonatomic, strong) NSMutableArray *cellTitles;
@property (nonatomic, strong) NSMutableArray *classNames;

- (void)addCell:(NSString *)title ClassName:(NSString *)className;

@end
