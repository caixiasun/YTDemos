//
//  Student.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/5.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)copyWithZone:(NSZone *)zone {
    Student *stu = [Student new];
    stu.name = self.name;
    return stu;
}

@end
