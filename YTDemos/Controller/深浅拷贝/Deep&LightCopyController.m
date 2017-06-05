//
//  Deep&LightCopyController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/5.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Deep&LightCopyController.h"
#import "Student.h"

@interface Deep_LightCopyController ()

@end

@implementation Deep_LightCopyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    NSString *str1 = @"你好";
    NSString *str2 = [str1 copy];
    str2 = @"世界";
    NSMutableString *str3 = [str1 mutableCopy];
    [str3 appendString:@"中国"];
//    DLog(@"_____str1 = %@, str2 = %@, str3 = %@",str1, str2, str3);
    
    NSMutableString *mstr1 = [[NSMutableString alloc] initWithString:@"你好"];
    NSString *mstr2 = [mstr1 copy];
    NSMutableString *mstr3 = [mstr1 mutableCopy];
    [mstr3 appendString:@"世界"];
    DLog(@"mstr1 = %@, mstr3 = %@",mstr1, mstr3);
     */
    
    /*
    NSArray *arr1 = @[@"a",@"b"];
    NSArray *arr2 = [arr1 copy];
    NSMutableArray *arr3 = [arr1 mutableCopy];
    arr3[0] = @"1";
//    DLog(@"arr1 = %@, arr3 = %@",arr1, arr3);
    
    NSMutableArray *marr1 = [[NSMutableArray alloc] initWithArray:arr1];
    NSArray *marr2 = [marr1 copy];
    NSMutableArray *marr3 = [marr1 mutableCopy];
    marr3[0] = @"123";
    DLog(@"marr1 = %@, marr3 = %@",marr1, marr3);
     */
    
    NSMutableString *name = [NSMutableString stringWithFormat:@"你好"];
    
    Student *stu = [Student new];
    stu.name = name;
    [name appendString:@"世界"];
    DLog(@"__stu2.name = %@",stu.name);
}

@end
