//
//  TestCell.h
//  YTDemos
//
//  Created by caixiasun on 2017/6/30.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

- (void)setContent:(NSDictionary *)data;

@end
