//
//  TableViewDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/13.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "TableViewDemoController.h"
#import "TableViewDemoCell.h"

@interface TableViewDemoController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation TableViewDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.center = self.view.center;
    [tableView registerClass:[TableViewDemoCell class] forCellReuseIdentifier:@"TableViewDemoCell"];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewDemoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewDemoCell" forIndexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

@end
