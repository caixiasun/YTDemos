//
//  CollectionViewDemoCell.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/13.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "CollectionViewDemoCell.h"

@implementation CollectionViewDemoCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = RedColor;
        imageView.frame = self.bounds;
        [self.contentView addSubview:imageView];
    }
    return self;
}

@end
