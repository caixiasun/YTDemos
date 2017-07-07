//
//  UINavigationController+StatusBar.m
//  YTDemos
//
//  Created by caixiasun on 2017/7/6.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "UINavigationController+StatusBar.h"

@implementation UINavigationController (StatusBar)

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [[self topViewController] preferredStatusBarStyle];
}

@end
