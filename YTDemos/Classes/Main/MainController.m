//
//  ViewController.m
//  YTDemos
//
//  Created by caixiasun on 2017/4/21.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "MainController.h"

@interface MainController () 

//@property (nonatomic, strong) UITableView    *tableView;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavi];
//    [self setupUI];
    [self.view addSubview:self.tableView];
    
    DLog(@"_%f",testFunction(2));
    
    [self addCell];
}

float testFunction(int flag) {
    if (YTScreenWidth == 320) {
        return 1.4;
    }
    return 2.3;
}

- (void)addCell {
    [self addCell:@"自定义DatePicker" ClassName:@"CustomDatePickerDemoController"];
    [self addCell:@"导航相关" ClassName:@"NaviDemoController"];
    [self addCell:@"iCarousel" ClassName:@"ICarouselDemoController"];
    [self addCell:@"IMP测试" ClassName:@"IMPDemoController"];
    [self addCell:@"JS Call OC" ClassName:@"JSCallOCController"];
    [self addCell:@"NSString" ClassName:@"NSStringDemoController"];
    [self addCell:@"七鱼" ClassName:@"QYDemoController"];
    [self addCell:@"ScrollViewDemo" ClassName:@"ScrollViewDemoController"];
    [self addCell:@"深、浅拷贝" ClassName:@"Deep_LightCopyController"];
    [self addCell:@"TextField" ClassName:@"TextFieldDemoController"];
    [self addCell:@"跳转至设置" ClassName:@"GoToSettingsController"];
    [self addCell:@"WMPageController" ClassName:@"PageDemoController"];
    
    [self.tableView reloadData];
}
- (void)setupNavi {
    self.navigationItem.title = @"主视图控制器";
}
- (void)setupUI {
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.equalTo(self.view);
//        make.center.equalTo(self.view);
//    }];
}
//- (UITableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        [self.view addSubview:_tableView];
//    }
//    return _tableView;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.cellTitles.count;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
//    cell.textLabel.text = [self.cellTitles objectAtIndex:indexPath.row];
//    return cell;
//}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (indexPath.row >= self.classNames.count) {
//        return ;
//    }
//    NSString *className = [self.classNames objectAtIndex:indexPath.row];
//    Class class = NSClassFromString(className);
//    if (class) {
//        UIViewController *vc = class.new;
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//}

@end
