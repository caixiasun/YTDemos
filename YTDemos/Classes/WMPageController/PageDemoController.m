//
//  PageDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/6.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "PageDemoController.h"
#import "PageController01.h"
#import "PageController02.h"
#import "PageController03.h"

@interface PageDemoController () <WMPageControllerDataSource, WMPageControllerDataSource>

@end

@implementation PageDemoController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.menuItemWidth = YTScreenWidth/self.titles.count;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"PageDemoController";
}
- (NSArray<NSString *> *)titles {
    return @[@"Red",@"Green",@"Blue"];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController * _Nonnull)pageController {
    return self.titles.count;
}
- (__kindof UIViewController * _Nonnull)pageController:(WMPageController * _Nonnull)pageController viewControllerAtIndex:(NSInteger)index {
    switch (index) {
        case 0:
        {
            return [PageController01 new];
        }
        case 1:
        {
            return [PageController02 new];
        }
        default:
            return [PageController03 new];
    }
}
- (NSString * _Nonnull)pageController:(WMPageController * _Nonnull)pageController titleAtIndex:(NSInteger)index {
    return self.titles[index];
}

@end
