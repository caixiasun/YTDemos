//
//  Demo01_TableVIewDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/30.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Demo01_TableVIewDemoController.h"
#import "Demo01_TableViewDemoCell.h"
#import "TestCell.h"

@interface Demo01_TableVIewDemoController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) Demo01_TableViewDemoCell *globalcell;

@end

@implementation Demo01_TableVIewDemoController

static NSString *identifier = @"TestCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 100;//很重要保障滑动流畅性
        _tableView.rowHeight = UITableViewAutomaticDimension;
//        [_tableView registerClass:[TestCell class] forCellReuseIdentifier:identifier];
        [_tableView registerNib:[UINib nibWithNibName:@"TestCell" bundle:nil] forCellReuseIdentifier:identifier];
        self.globalcell = [_tableView dequeueReusableCellWithIdentifier:identifier];
    }
    return _tableView;
}
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
        
        NSMutableArray *heads = [[NSMutableArray alloc] init];
        NSMutableArray *names = [[NSMutableArray alloc] init];
        NSMutableArray *contents = [[NSMutableArray alloc] init];
        NSMutableArray *content_pics = [[NSMutableArray alloc] init];
        for (int i=0; i<10; i++) {
            [heads addObject:[NSString stringWithFormat:@"%d.jpeg",i+1]];
            [names addObject:[NSString stringWithFormat:@"用户 %d",i+1]];
            NSString *content;
            switch (i%4) {
                case 0:
                {
                    content = @"测试下看得开上课但是开发绝对是浪费";
                    break;
                }
                case 1:
                {
                    content = @"测试下看得开上课但是开发绝对是浪费测试下看得开上课但是开发绝对是浪测试下看得开上课但是开发绝对是浪测试下看得开上课但是开发绝对是浪测试下看得开上课但是开发绝对是浪";
                    break;
                }
                case 2:
                {
                    content = @"测试下看得开上课但是开发绝对是浪费测试下看得开上课但是开发绝对是浪测试下看得开上课但是开发绝对是浪测试下看得开上课但是开发绝对是浪测试下看得开上课但是开发绝对是浪测试下看得开上课但是开发绝对是浪测试下看得开上课但是开发绝对是浪";
                    break;
                }
                case 3:
                {
                    content = @"测试下看得开上课但是开发绝对是浪费";
                    break;
                }
                default:
                    break;
            }
            [contents addObject:content];
            [content_pics addObject:[NSString stringWithFormat:@"%d.jpeg",i+1]];
            
        }
        for (int i=0; i<heads.count && i<names.count&&i<contents.count&&i<content_pics.count; i++) {
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            [dic setObject:heads[i] forKey:@"head"];
            [dic setObject:names[i] forKey:@"name"];
            [dic setObject:contents[i] forKey:@"content"];
            [dic setObject:content_pics[i] forKey:@"content_pic"];
            [_dataSource addObject:dic];
        }
    }
    return _dataSource;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    [cell setContent:[self.dataSource objectAtIndex:indexPath.row]];
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 44;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    Demo01_TableViewDemoCell *cell = self.globalcell;
////    cell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
//    [cell setContent:[self.dataSource objectAtIndex:indexPath.row]];
//    
////    [cell setNeedsUpdateConstraints];
////    [cell updateConstraintsIfNeeded];
////    
////    cell.bounds = CGRectMake(0, 0, self.tableView.width, cell.height);
////    [cell setNeedsLayout];
////    [cell layoutIfNeeded];
//    
//    CGFloat contentView_width = CGRectGetWidth(self.tableView.bounds);
//    NSLayoutConstraint *widthConstraints = [NSLayoutConstraint constraintWithItem:cell.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:contentView_width];
//    [cell addConstraint:widthConstraints];
//    CGFloat fittingHeihgt = [cell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
//    [cell removeConstraint:widthConstraints];
//    return fittingHeihgt + 2*1/[UIScreen mainScreen].scale;
////    return UITableViewAutomaticDimension;
//    
//}

@end
