//
//  Demo01_TableViewDemoCell.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/30.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Demo01_TableViewDemoCell.h"

@interface Demo01_TableViewDemoCell ()

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIImageView *contentImageView;
@property (nonatomic, strong) UILabel     *nameLab;
@property (nonatomic, strong) UILabel     *contentLab;

@end
@implementation Demo01_TableViewDemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.nameLab];
    [self.contentView addSubview:self.contentLab];
//    [self.contentView addSubview:self.contentImageView];
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset = 50;
        make.width.offset = 50;
        make.left.offset = 10;
        make.top.offset = 10;
    }];
    
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImageView);
        make.left.equalTo(self.headImageView.mas_right).offset = 5;
        make.right.offset = -5;
    }];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.nameLab);
        make.top.equalTo(self.nameLab.mas_bottom).offset = 5;
    }];
//    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.contentLab);
//        make.top.equalTo(self.contentLab.mas_bottom).offset = 10;
//    }];
    
}

- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
//        _headImageView.frame = CGRectMake(10, 10, 50, 50);
        _headImageView.layer.cornerRadius = 25;
        _headImageView.layer.masksToBounds = YES;
    }
    return _headImageView;
}
- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] init];
//        _nameLab.frame = CGRectMake(0, 0, self.width - 25 - 3 * 10, 25);
//        _nameLab.left = self.headImageView.right + 10;
//        _nameLab.top = self.headImageView.top;
        _nameLab.font = [UIFont systemFontOfSize:15];
    }
    return _nameLab;
}
- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [[UILabel alloc] init];
//        _contentLab.frame = CGRectMake(self.nameLab.left, self.nameLab.bottom+10, self.nameLab.width, 0);
        _contentLab.font = [UIFont systemFontOfSize:14];
        _contentLab.textColor = GrayColor;
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}
- (UIImageView *)contentImageView {
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
//        _contentImageView.frame = CGRectMake(self.contentLab.left, self.contentLab.bottom + 10, 10, 10);
    }
    return _contentImageView;
}

- (void)setContent:(NSDictionary *)data {
//    CGRect frame;
    self.headImageView.image = [UIImage imageNamed:[data objectForKey:@"head"]];
    self.nameLab.text = [data objectForKey:@"name"];
    NSString *content = [data objectForKey:@"content"];
//    CGSize size = [content boundingRectWithSize:CGSizeMake(self.contentLab.width, MAXFLOAT) options:0 attributes:nil context:nil].size;
    self.contentLab.text = content;
    
//    self.contentImageView.top = self.contentLab.bottom+10;
//    UIImage *image = [UIImage imageNamed:[data objectForKey:@"content_pic"]];
//    self.contentImageView.image = image;
//    [self.contentImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.contentLab);
//        make.top.equalTo(self.contentLab.mas_bottom).offset = 20;
//        make.size.mas_equalTo([self scaleImage:image.size]);
//    }];
}

- (CGSize)scaleImage:(CGSize)size {
    if (size.width > 240) {
        CGFloat width = 240;
        CGFloat height = width/size.width * size.height;
        return CGSizeMake(width, height);
    }
    return size;
}

@end
