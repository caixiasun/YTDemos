//
//  MyPageControl.m
//  Test
//
//  Created by 侯康柱 on 15/10/2.
//  Copyright (c) 2015年 HKZ. All rights reserved.
//

#import "MyPageControl.h"

@implementation MyPageControl

-(id) initWithFrame:(CGRect)frame

{
    
    self = [super initWithFrame:frame];
    
    return self;
    
}


-(void) updateDots

{
//    long count = self.subviews.count;
    for (int i=0; i<[self.subviews count]; i++) {
        NSLog(@"______%@",self.subviews);
        UIImageView* dot = [self.subviews objectAtIndex:i];
        
        CGSize size;
        
        size.height = 3;     //自定义圆点的大小
        
        size.width = 10;      //自定义圆点的大小
        [dot setFrame:CGRectMake(dot.frame.origin.x, dot.frame.origin.y, size.width, size.height)];

        
        if (i == self.currentPage) {
            dot.backgroundColor = [UIColor redColor];
        }
        else
        {
            dot.backgroundColor = [UIColor colorWithRed:.7 green:.7 blue:.7 alpha:1];
        }
    }
    
}

-(void) setCurrentPage:(NSInteger)page

{
    
    [super setCurrentPage:page];
    
    [self updateDots];
    
}

@end
