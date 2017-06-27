//
//  PageController01.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/6.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "PageController01.h"

@interface PageController01 ()

@end

@implementation PageController01

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *lab = [UILabel new];
    lab.text = @"vc01";
    lab.textColor = RedColor;
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset = 20;
        make.centerX.equalTo(self.view);
    }];
    
    UILabel *tapLabel = [UILabel new];
    tapLabel.userInteractionEnabled = YES;
    tapLabel.textColor = BlueColor;
    tapLabel.text = @"我是一个Label，点击我的时候，view不可点";
    tapLabel.numberOfLines = 0;
    tapLabel.tag = 111;
    [self.view addSubview:tapLabel];
    [tapLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab.mas_bottom).offset = 30;
        make.centerX.equalTo(lab);
        make.width.mas_lessThanOrEqualTo(YTScreenWidth*0.6);
    }];
    /*
    UITapGestureRecognizer *singTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    singTap.numberOfTapsRequired = 1;
    [tapLabel addGestureRecognizer:singTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    doubleTap.numberOfTapsRequired = 2;
    [tapLabel addGestureRecognizer:doubleTap];
    
    [singTap requireGestureRecognizerToFail:doubleTap]; //只有当doubleTap识别失败时才会触发singTap。
     */
    
    UITapGestureRecognizer *labTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction2:)];
    [tapLabel addGestureRecognizer:labTap];
    
    UITapGestureRecognizer *viewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction2:)];
    [self.view addGestureRecognizer:viewTap];
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    if (tap.numberOfTapsRequired == 1) {
        DLog(@"label was single clicked...");
    }else {
        DLog(@"label was double clicked...");
    }
}

- (void)tapAction2:(UITapGestureRecognizer *)tap {
    if (tap.view.tag == 111) {
        DLog(@"label was clicked...");
    }else {
        DLog(@"self.view was clicked...");
    }
}

@end
