//
//  Demo01_FontDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/30.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Demo01_FontDemoController.h"

@interface Demo01_FontDemoController ()

@property (nonatomic, strong) NSArray *fontNames;
@property (nonatomic, strong) UILabel *nameLab;

@end

@implementation Demo01_FontDemoController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *lab = [[UILabel alloc] init];
    lab.textColor = BlackColor;
    lab.text = self.fontNames[0];
    lab.font = [UIFont fontWithName:self.fontNames[0] size:30];
    [self.view addSubview:lab];
    self.nameLab = lab;
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.offset = 100;
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"Previous" forState:UIControlStateNormal];
    [btn setTitleColor:RedColor forState:UIControlStateNormal];
    btn.tag = 1;
    btn.layer.borderColor = BlackColor.CGColor;
    btn.layer.borderWidth = 0.5;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab.mas_bottom).offset = 100;
        make.left.offset = 20;
        make.width.offset = 80;
        make.height.offset = 40;
    }];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"Next" forState:UIControlStateNormal];
    [btn2 setTitleColor:RedColor forState:UIControlStateNormal];
    btn2.tag = 2;
    btn2.layer.borderColor = BlackColor.CGColor;
    btn2.layer.borderWidth = 0.5;
    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn2 addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerY.equalTo(btn);
        make.right.offset = -20;
    }];
    
    UILabel *lab2 = [[UILabel alloc] init];
    lab2.text = @"测试下细体呀，效果怎么样？";
    lab2.font = [UIFont fontWithName:@"PingFangSC-Ultralight" size:20];
    [self.view addSubview:lab2];
    [lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset = -100;
    }];
    
    [self printFamilyNames];
    
}

- (void)printFamilyNames {
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily=0; indFamily<[familyNames count]; ++indFamily) {
        NSLog(@"-------------Family name: %@--------------------------------",[familyNames objectAtIndex:indFamily]);
        fontNames = [[NSArray alloc] initWithArray:[UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indFamily]]];
        for (indFont=0; indFont<fontNames.count; ++indFont) {
            NSLog(@"Font name : %@",[fontNames objectAtIndex:indFont]);
        }
    }
}

- (NSArray *)fontNames {
    return @[
             @"AppleGothic",@"American Typewriter",@"Arial",@"Arial Rounded MT Bold",@"Arial Unicode MS",@"DB LCD Temp",
             @"Georgia",@"Helvetica",@"Hiragino Kaku Gothic **** W6",@"Marker Felt",@"STHeiti J",@"Hiragino Kaku Gothic **** W3",@"Courier",@"Courier New",@"Helvetica Neue",
             @"Times New Roman",@"Trebuchet MS",@"Verdana",@"Zapfino",
             ];
}

- (void)itemAction:(UIButton *)item {//细体 Courier New
    static NSInteger num = 0;
    NSLog(@"num = %ld",num);
    self.nameLab.text = self.fontNames[num];
    self.nameLab.font = [UIFont fontWithName:self.fontNames[num] size:30];
    if (item.tag == 1) {
        num --;
        if (num < 0) {
            num = self.fontNames.count-1;
        }
    }else {
        num ++;
        if (num > self.fontNames.count) {
            num = 0;
        }
    }
    
}



@end
