//
//  UIViewController+IMPViewDidLoaded.m
//  YTDemos
//
//  Created by caixiasun on 2017/5/19.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "UIViewController+IMPViewDidLoaded.h"
#import <objc/runtime.h>

@implementation UIViewController (IMPViewDidLoaded)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //获取这个类的viewDidLoad方法,它的类型是一个objc_moethod结构体的指针
        Method viewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
        //获取自定义的方法
        Method viewDidLoaded = class_getInstanceMethod(self, @selector(viewDidUnload));
        
        //互换两个方法实现
        method_exchangeImplementations(viewDidLoad, viewDidLoaded);
    });
}

- (void)viewDidLoaded {
    [self viewDidLoaded];
    NSLog(@"______ %@ did load",self);
}


@end
