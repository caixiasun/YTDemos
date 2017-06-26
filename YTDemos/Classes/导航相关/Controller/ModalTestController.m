//
//  ModalTestController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/14.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "ModalTestController.h"

@interface ModalTestController ()

@end

@implementation ModalTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton new];
    [btn setTitleColor:BlackColor forState:UIControlStateNormal];
    [btn setTitle:@"关闭" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(itemAction) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.borderColor = BlackColor.CGColor;
    btn.layer.borderWidth = 1;
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.offset = YTFitWidth(300);
        make.height.offset = YTFitHeight(80);
    }];
    
    self.view.backgroundColor = YellowColor;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    DLog(@"______________%@",self.navigationController.viewControllers);
//    DLog(@"______________%@",self.presentedViewController);
    
//    DLog(@"____%s",__func__);
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    DLog(@"____%s",__func__);
}
- (void)itemAction {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)dealloc {
    DLog(@"_______ModalTestController  delloc was excuted......");
}

@end
