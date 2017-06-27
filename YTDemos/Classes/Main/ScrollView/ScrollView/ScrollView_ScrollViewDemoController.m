//
//  ScrollView_ScrollViewDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/13.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "ScrollView_ScrollViewDemoController.h"

@interface ScrollView_ScrollViewDemoController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ScrollView_ScrollViewDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //测试  automaticallyAdjustsScrollViewInsets  属性
    
    self.navigationController.navigationBar.translucent = YES;
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.frame = self.view.bounds;
    scrollView.center = self.view.center;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    UIImageView *imageView = [UIImageView new];
    imageView.frame = CGRectMake(0, 0, 100, 100);
    imageView.backgroundColor = RedColor;
    imageView.layer.cornerRadius = 10;
    imageView.layer.masksToBounds = YES;
    [scrollView addSubview:imageView];
}


@end
