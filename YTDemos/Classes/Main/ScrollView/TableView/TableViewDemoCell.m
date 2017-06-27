//
//  TableViewDemoCell.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/13.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "TableViewDemoCell.h"

@interface TableViewDemoCell ()

@property (nonatomic, strong) UIView *testView;

@end

@implementation TableViewDemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.testView = [UIView new];
        self.testView.frame = self.bounds;
        self.testView.backgroundColor = RedColor;
        self.testView.center = self.center;
        [self addSubview:self.testView];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.testView.frame = self.bounds;
}

@end
