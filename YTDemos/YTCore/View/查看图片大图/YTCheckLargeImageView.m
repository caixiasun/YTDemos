//
//  YTCheckLargeImageView.m
//  YatouTest00123
//
//  Created by caixiasun on 2016/11/9.
//  Copyright © 2016年 yatou. All rights reserved.
//

#import "YTCheckLargeImageView.h"
#import "AppDelegate.h"

@interface YTCheckLargeImageView()

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation YTCheckLargeImageView

+ (YTCheckLargeImageView *)createWithImage:(NSString *)imageName Origin:(CGPoint)origin {
    YTCheckLargeImageView *view = [[YTCheckLargeImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    view.backgroundColor = [UIColor blackColor];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.window addSubview:view];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:view action:@selector(tapAction)];
    [view addGestureRecognizer:tap];
    
    view.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageName]]];
    view.origin = origin;
    [view setupUI];
    
    return view;
}

- (void)setupUI {
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width-10;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height-10;
    CGSize size = self.image.size;
    if (size.width >= size.height) {
        if (size.width > screenW) {
            size.height = screenW * (size.height/size.width);
            size.width = screenW;
        }else if (size.height > screenH) {
            size.width = screenH * (size.width/size.height);
            size.height = screenH;
        }
    }else {
        if (size.height > screenH) {
            size.width = screenH * (size.width/size.height);
            size.height = screenH;
        }else if (size.width > screenW) {
            size.height = screenW * (size.height/size.width);
            size.width = screenW;
        }
    }
    
    UIImageView *imgView = [UIImageView new];
    imgView.frame = CGRectMake(self.origin.x, self.origin.y, size.width, size.height);
    imgView.center = CGPointMake(self.centerX, imgView.centerY);
    imgView.image = self.image;
    [self addSubview:imgView];
    self.imageView = imgView;
    
    [UIView animateWithDuration:.2 animations:^{
        imgView.center = self.center;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.3 animations:^{
            imgView.transform = CGAffineTransformScale(imgView.transform, .7, .7);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:.3 animations:^{
                imgView.transform = CGAffineTransformScale(imgView.transform, 1.4, 1.4);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:.3 animations:^{
                    imgView.transform = CGAffineTransformScale(imgView.transform, 1.0, 1.0);
                }];
            }];
        }];
    }];
}

- (void)tapAction {
    [self hide];
}

- (void)hide {
    if (self.imageView) {
        [UIView animateWithDuration:.3 animations:^{
            self.imageView.transform = CGAffineTransformScale(self.imageView.transform, .1, .1);
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }else {
        [UIView animateWithDuration:.3 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
    
}

@end
