//
//  YTDatePicker.h
//  YTDemos
//
//  Created by caixiasun on 2017/6/21.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTDatePicker : UIView

/*!
 Minimum selectable date in UIDatePicker. Default is nil.
 */
@property (nonatomic, retain) NSDate *minimumDate;

/*!
 Maximum selectable date in UIDatePicker. Default is nil.
 */
@property (nonatomic, retain) NSDate *maximumDate;

@property (nonatomic, retain) UILabel *titleLabel;


/*************** Method *********************/
- (instancetype)initWithDelegate:(id)delegate;

- (void)show;

- (void)hide;

@end

@protocol YTDatePickerDelegate <NSObject>

@end
