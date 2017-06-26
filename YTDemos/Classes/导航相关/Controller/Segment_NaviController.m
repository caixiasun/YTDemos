//
//  Segment_NaviController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/7.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Segment_NaviController.h"
#import "YTSegmentedControl.h"

@interface Segment_NaviController () <YTSegmentedControlDelegate>

@property (nonatomic, strong) YTSegmentedControl *segmented;
@end

@implementation Segment_NaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WhiteColor;
    
    _segmented = [[YTSegmentedControl alloc] init];
    _segmented.titles = @[@"家居",@"美衣",@"数码",@"美食美食美食美食美食美食美"];
    _segmented.delegate = self;
    _segmented.color_titleSelect = BlueColor;
    [self.view addSubview:_segmented];
    
    UIButton *btn1 = [UIButton new];
    [btn1 setTitle:@"点击--切换" forState:UIControlStateNormal];
    [btn1 setTitleColor:WhiteColor forState:UIControlStateNormal];
    btn1.backgroundColor = RedColor;
    [btn1 addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset = YTFitWidth(250);
        make.height.offset = YTFitHeight(60);
        make.center.equalTo(self.view);
    }];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    DLog(@"____%s",__func__);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    DLog(@"____%s",__func__);
}
- (void)itemAction:(UIButton *)item {
    switch (item.tag) {
        case 0:
        {
            NSInteger num = self.segmented.selectedIndex;
            num++;
            if (num >= self.segmented.numberOfItems) {
                num = 0;
            }
            self.segmented.selectedIndex = num;
            self.segmented.color_titleNormal = GrayColor;
            
            break;
        }
        default:
            break;
    }
}
- (void)segmented:(YTSegmentedControl *)segmented didSelectItemAtIndex:(NSInteger)index {
    UIColor *color;
    switch (index%4) {
        case 0:
        {
            color = [UIColor colorWithRed:.7 green:.2 blue:.2 alpha:.4];
            break;
        }
        case 1:
        {
            color = [UIColor colorWithRed:.3 green:.8 blue:.2 alpha:.4];;
            break;
        }
        case 2:
        {
            color = [UIColor colorWithRed:.3 green:.2 blue:.9 alpha:.4];;
            break;
        }
        case 3:
        {
            color = [UIColor colorWithRed:.1 green:.5 blue:.5 alpha:.4];;
            break;
        }
        default:
            break;
    }
    self.view.backgroundColor = color;
}

@end
