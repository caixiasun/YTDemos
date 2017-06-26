//
//  UIViewController+YTViewController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/13.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "UIViewController+YTViewController.h"
#import <objc/runtime.h>

static const void *cellTitlesKey = &cellTitlesKey;
static const void *classNamesKey = &classNamesKey;

@implementation UIViewController (YTViewController)

@dynamic classNames;
@dynamic cellTitles;

- (void)addCell:(NSString *)title ClassName:(NSString *)className {
    [self.cellTitles addObject:title];
    [self.classNames addObject:className];
}

- (NSMutableArray *)cellTitles {
    NSMutableArray *arr = objc_getAssociatedObject(self, cellTitlesKey);
    if (!arr || ![arr isKindOfClass:[NSMutableArray class]]) {
        arr = [NSMutableArray new];
        objc_setAssociatedObject(self, cellTitlesKey, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}
//- (void)setCellTitles:(NSMutableArray *)cellTitles {
//    objc_setAssociatedObject(self, cellTitlesKey, cellTitles, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
- (NSMutableArray *)classNames {
    NSMutableArray *arr = objc_getAssociatedObject(self, classNamesKey);
    if (!arr || ![arr isKindOfClass:[NSMutableArray class]]) {
        arr = [NSMutableArray new];
        objc_setAssociatedObject(self, classNamesKey, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}
//- (void)setClassNames:(NSMutableArray *)classNames {
//    objc_setAssociatedObject(self, classNamesKey, classNames, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}

@end
