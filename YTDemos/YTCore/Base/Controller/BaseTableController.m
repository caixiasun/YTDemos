//
//  BaseController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/21.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "BaseTableController.h"

@interface BaseTableController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation BaseTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellTitles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [self.cellTitles objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row >= self.classNames.count) {
        return ;
    }
    NSString *className = [self.classNames objectAtIndex:indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *vc = class.new;
        vc.hidesBottomBarWhenPushed = YES;
        vc.title = className;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
