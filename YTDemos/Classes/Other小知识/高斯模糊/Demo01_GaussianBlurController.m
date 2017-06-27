//
//  Demo01_GaussianBlurController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/27.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Demo01_GaussianBlurController.h"

@interface Demo01_GaussianBlurController ()

@end

@implementation Demo01_GaussianBlurController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self coreImage];
}

- (void)coreImage {
    
}

//- (UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur {
//    CIContext *context = [CIContext contextWithOptions:nil];
//    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
//    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
////    filter
//}

@end
