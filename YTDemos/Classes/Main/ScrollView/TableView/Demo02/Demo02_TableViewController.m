//
//  Demo02_TableViewController.m
//  YTDemos
//
//  Created by caixiasun on 2017/7/7.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Demo02_TableViewController.h"

@interface Demo02_TableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation Demo02_TableViewController

static NSString *identifier = @"UITableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //////多选cell，测试 [cell  addSubview:view]  和   [cell.contentView addSubview:view]  的区别
    [self setupNavi];
    
    [self.view addSubview:self.tableView];
}

- (void)setupNavi {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.bounds = CGRectMake(0, 0, 60, 25);
    btn.titleLabel.font = [UIFont systemFontOfSize:15 weight:-1];
    [btn setTitle:@"Edit" forState:UIControlStateNormal];
    [btn setTitleColor:BlackColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)editAction:(UIButton *)item {
    item.selected = !item.selected;
    self.tableView.editing = item.selected;
    
    [item setTitle:item.selected ? @"Done": @"Edit" forState:UIControlStateNormal];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"---  %ld ---",indexPath.row];
    return cell;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    }
    return _tableView;
}

@end
