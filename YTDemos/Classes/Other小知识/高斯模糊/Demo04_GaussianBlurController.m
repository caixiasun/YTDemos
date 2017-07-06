//
//  Demo04_GaussianBlurController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/29.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Demo04_GaussianBlurController.h"
#import <FXBlurView.h>

@interface Demo04_GaussianBlurController ()

@property (nonatomic, strong) FXBlurView *blurView;

@end

@implementation Demo04_GaussianBlurController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"blur_01.jpeg"];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = image;
    [self.view addSubview:imageview];
    
    
    FXBlurView *blurView = [[FXBlurView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    blurView.center = self.view.center;
    blurView.backgroundColor = WhiteColor;
    blurView.dynamic = YES;
    blurView.blurRadius = 10.0;
    [self.view addSubview:blurView];
    self.blurView = blurView;
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    self.blurView.center = point;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
