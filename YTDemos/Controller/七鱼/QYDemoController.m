//
//  QYDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/1.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "QYDemoController.h"
#import <QYSDK.h>

@interface QYDemoController ()

@end

@implementation QYDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavi];
}
- (void)setupNavi {
    UIButton *item = [UIButton new];
    item.bounds = CGRectMake(0, 0, 80, 30);
    [item setTitle:@"客服" forState:UIControlStateNormal];
    [item setTitleColor:BlackColor forState:UIControlStateNormal];
    [item addTarget:self action:@selector(itemAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:item];
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)qy_configuration {
    
    [[QYSDK sharedSDK] customUIConfig].customerHeadImage = [UIImage imageNamed:@"my_head"];
    
    QYSource *source = [[QYSource alloc] init];
    source.title = @"Source Title";
    source.urlString = @"http://www.baidu.com";
    QYSessionViewController *vc = [[QYSDK sharedSDK] sessionViewController];
    vc.source = source;
    vc.sessionTitle = @"丫头客服";
    vc.hidesBottomBarWhenPushed = YES;
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"测试" style:UIBarButtonItemStylePlain target:self action:@selector(testAction)];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)testAction {
    DLog(@"________test action was excuted...");
}
- (void)itemAction {
    [self qy_configuration];
}

@end
