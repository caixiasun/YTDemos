//
//  NSStringDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/5/22.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "NSStringDemoController.h"

@interface NSStringDemoController ()

@end

@implementation NSStringDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    //使用@""的形式生成的NSString，深浅拷贝都不会影响原NSString。
    
    NSString *str1 = @"你好呀";
    NSString *str2 = [str1 copy];//浅拷贝
    str2 = @"丫头";
    DLog(@"__str1 = %@, str2 = %@",str1,str2);
    
    str1 = @"你好呀";
    NSString *str3 = [str1 mutableCopy];//深拷贝
    str3 = @"阿狸";
    DLog(@"__str1 = %@, str3 = %@",str1, str3);
    
    /*
    NSString *str4 = [[NSString alloc] initWithFormat:@"abc"];
    NSString *str5 = [str4 copy];
    str5 = @"5 abc";
    DLog(@"__str4 = %@, str5 = %@",str4,str5);
    NSString *str6 = [str4 mutableCopy];
    str6 = @"6 abc";
    DLog(@"__str4 = %@, str6 = %@",str4,str6);
    */
    /*
    NSMutableString *str7 = [[NSMutableString alloc] initWithFormat:@"abc"];
    NSMutableString *str8 = [str7 copy];
//    [str8 appendString:@"888"];
    DLog(@"__str7 = %@, str8 = %@",str7, str8);
    NSMutableString *str9 = [str7 mutableCopy];
    [str9 appendString:@"999"];
    DLog(@"__str7 = %@, str9 = %@",str7, str9);
     */
}

@end
