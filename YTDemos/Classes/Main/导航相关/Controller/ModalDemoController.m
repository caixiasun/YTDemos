//
//  ModalDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/14.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "ModalDemoController.h"
#import "ModalTestController.h"

@interface ModalDemoController ()

@end

@implementation ModalDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WhiteColor;
    
    [self setupUI];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setHidden:NO];
    
}
- (void)itemAction:(UIButton *)item {
    if (item.tag == 11) {
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[[ModalTestController alloc] init]];
        [self.navigationController presentViewController:navi animated:YES completion:nil];
    }else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)setupUI {
    
    UIButton *btn = [UIButton new];
    [btn setTitle:@"模态弹出" forState:UIControlStateNormal];
    [btn setTitleColor:RedColor forState:UIControlStateNormal];
    btn.layer.borderWidth = 0.5;
    btn.layer.borderColor = BlackColor.CGColor;
    btn.tag = 11;
    [btn addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.right.equalTo(self.view.mas_centerX).offset = -YTFitWidth(30);
        make.width.offset = YTScreenWidth * 0.3;
        make.height.offset = YTFitHeight(80);
    }];
    
    
    UIButton *btn2 = [UIButton new];
    btn2.layer.borderColor = BlackColor.CGColor;
    btn2.layer.borderWidth = 0.5;
    [btn2 setTitle:@"退出界面" forState:UIControlStateNormal];
    [btn2 setTitleColor:BlackColor forState:UIControlStateNormal];
    btn2.tag = 22;
    [btn2 addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerY.equalTo(btn);
        make.left.equalTo(self.view.mas_centerX).offset = YTFitWidth(30);
    }];
}

@end
