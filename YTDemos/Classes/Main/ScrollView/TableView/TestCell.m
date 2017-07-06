//
//  TestCell.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/30.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "TestCell.h"

@implementation TestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.layer.masksToBounds = YES;
}

- (void)setContent:(NSDictionary *)data {
    
    self.headImageView.image = [UIImage imageNamed:[data objectForKey:@"head"]];
    self.nameLab.text = [data objectForKey:@"name"];
    NSString *content = [data objectForKey:@"content"];
    //    CGSize size = [content boundingRectWithSize:CGSizeMake(self.contentLab.width, MAXFLOAT) options:0 attributes:nil context:nil].size;
    self.contentLab.text = content;
}

@end
