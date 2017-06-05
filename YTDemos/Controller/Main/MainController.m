//
//  ViewController.m
//  YTDemos
//
//  Created by caixiasun on 2017/4/21.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "MainController.h"

@interface MainController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavi];
    [self setupUI];
    
    self.titles = [@[] mutableCopy];
    self.classNames = [@[] mutableCopy];
    
    [self addCell:@"深、浅拷贝" ClassName:@"Deep_LightCopyController"];
    [self addCell:@"七鱼" ClassName:@"QYDemoController"];
    [self addCell:@"iCarousel" ClassName:@"ICarouselDemoController"];
    [self addCell:@"JS Call OC" ClassName:@"JSCallOCController"];
    [self addCell:@"NSString" ClassName:@"NSStringDemoController"];
    [self addCell:@"IMP测试" ClassName:@"IMPDemoController"];
    [self addCell:@"跳转至设置" ClassName:@"GoToSettingsController"];
}
- (void)addCell:(NSString *)title ClassName:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
    [self.tableView reloadData];
}
- (void)setupNavi {
    self.navigationItem.title = @"主视图控制器";
}
- (void)setupUI {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
        make.center.equalTo(self.view);
    }];
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [self.titles objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = [self.classNames objectAtIndex:indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *vc = class.new;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
