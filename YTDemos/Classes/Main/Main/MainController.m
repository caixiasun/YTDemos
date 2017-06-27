//
//  ViewController.m
//  YTDemos
//
//  Created by caixiasun on 2017/4/21.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "MainController.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavi];
    [self.view addSubview:self.tableView];
    
    DLog(@"_%f",testFunction(2));
    
    [self addCell];
}

float testFunction(int flag) {
    if (YTScreenWidth == 320) {
        return 1.4;
    }
    return 2.3;
}

- (void)addCell {
    [self addCell:@"自定义DatePicker" ClassName:@"CustomDatePickerDemoController"];
    [self addCell:@"导航相关" ClassName:@"NaviDemoController"];
    [self addCell:@"iCarousel" ClassName:@"ICarouselDemoController"];
    [self addCell:@"IMP测试" ClassName:@"IMPDemoController"];
    [self addCell:@"JS Call OC" ClassName:@"JSCallOCController"];
    [self addCell:@"NSString" ClassName:@"NSStringDemoController"];
    [self addCell:@"七鱼" ClassName:@"QYDemoController"];
    [self addCell:@"ScrollViewDemo" ClassName:@"ScrollViewDemoController"];
    [self addCell:@"深、浅拷贝" ClassName:@"Deep_LightCopyController"];
    [self addCell:@"TextField" ClassName:@"TextFieldDemoController"];
    [self addCell:@"跳转至设置" ClassName:@"GoToSettingsController"];
    [self addCell:@"WMPageController" ClassName:@"PageDemoController"];
    
    [self.tableView reloadData];
}
- (void)setupNavi {
    self.navigationItem.title = @"主视图控制器";
}

@end
