//
//  YTSegmentedControl.h
//  YTDemos
//
//  Created by yatou on 2017/6/7.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YTSegmentedControlDelegate;

@interface YTSegmentedControl : UIView

@property (nonatomic,   weak) id<YTSegmentedControlDelegate> delegate;

/**
 所有item的标题
 */
@property (nonatomic, strong)           NSArray   *titles;

/**
 当前选中的item的index
 */
@property (nonatomic, assign)           NSInteger selectedIndex;

/**
 Item的个数
 */
@property (nonatomic, assign, readonly) NSInteger numberOfItems;

/**
 文字正常颜色，默认GrayColor
 */
@property (nonatomic, strong)           UIColor  *color_titleNormal;

/**
 文字选中颜色，默认BlackColor
 */
@property (nonatomic, strong)           UIColor  *color_titleSelect;

/**
 边框颜色，默认BlueColor
 */
@property (nonatomic, strong)           UIColor  *color_border;

/**
 文字字体，默认字号
 */
@property (nonatomic, strong)           UIFont   *font_titleNormal;


- (instancetype)initWithWithTitles:(NSArray *)titles Delegate:(id)delegate;

@end

@protocol YTSegmentedControlDelegate <NSObject>

@optional
- (void)segmented:(YTSegmentedControl *)segmented didSelectItemAtIndex:(NSInteger)index;

@end
