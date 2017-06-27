//
//  MyController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/15.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "MyController.h"
#import "Segment_NaviController.h"
#import "ModalTestController.h"

@interface MyController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation MyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setupUI];
}
- (void)setupUI {
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
        make.center.equalTo(self.view);
    }];
    
    UIView *backV = [UIView new];
    backV.backgroundColor = BlackColor;
    [self.scrollView addSubview:backV];
    [backV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = -1000;
        make.height.offset = 1000;
        make.width.and.centerX.equalTo(self.view);
    }];
    
    
    UIView *view = [UIView new];
    view.backgroundColor = BlackColor;
    [self.scrollView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.centerX.equalTo(backV);
        make.top.equalTo(backV.mas_bottom);
        make.height.offset = YTFitHeight(300);
    }];
    
    UIView *view2 = [UIView new];
    view2.backgroundColor = GreenColor;
    [self.scrollView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.and.width.equalTo(view);
        make.height.offset = YTScreenHeight;
        make.top.equalTo(view.mas_bottom);
    }];
    
    UIButton *push = [UIButton new];
    [push setTitle:@"PUSH" forState:UIControlStateNormal];
    [push setTitleColor:RedColor forState:UIControlStateNormal];
    push.layer.borderColor = BlackColor.CGColor;
    push.layer.borderWidth = 0.5;
    push.tag = 11;
    [push addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:push];
    [push mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = 200;
        make.height.offset = YTFitHeight(80);
        make.right.equalTo(self.view.mas_centerX).offset = -YTFitWidth(30);
        make.width.equalTo(self.view).multipliedBy(0.3);
    }];
    
    UIButton *modal = [UIButton new];
    [modal setTitle:@"Modal" forState:UIControlStateNormal];
    [modal setTitleColor:RedColor forState:UIControlStateNormal];
    modal.layer.borderColor = BlackColor.CGColor;
    modal.layer.borderWidth = 0.5;
    modal.tag = 22;
    [modal addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:modal];
    [modal mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerY.equalTo(push);
        make.left.equalTo(self.view.mas_centerX).offset = YTFitWidth(30);
    }];
    
    [self.view layoutIfNeeded];
    [self.scrollView setContentSize:CGSizeMake(YTScreenWidth, view2.bottom)];
}
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    DLog(@"____%s",__func__);
    
    [self.navigationController.navigationBar setHidden:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    DLog(@"____%s",__func__);
    
    [self.navigationController.navigationBar setHidden:NO];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}
- (void)itemAction:(UIButton *)item {
    if (item.tag == 11) {
        Segment_NaviController *vc = [[Segment_NaviController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        ModalTestController *vc = [[ModalTestController alloc] init];
        vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        vc.hidesBottomBarWhenPushed = YES;
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
        navi.definesPresentationContext = YES;
        navi.modalPresentationStyle = UIModalPresentationCurrentContext;
        [self.navigationController presentViewController:navi animated:YES completion:^{
            navi.navigationBarHidden = YES;
        }];
    }
}

@end
