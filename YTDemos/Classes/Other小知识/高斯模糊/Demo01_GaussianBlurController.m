//
//  Demo01_GaussianBlurController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/27.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "Demo01_GaussianBlurController.h"
#import <Accelerate/Accelerate.h>

@interface Demo01_GaussianBlurController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage     *image;

@end

@implementation Demo01_GaussianBlurController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /*********
     此两种方法，会造成CPU和内存暴涨，可能线程使用不当。
     */
    
    self.image = [UIImage imageNamed:@"blur_01.jpeg"];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = self.image;
    [self.view addSubview:imageView];
    self.imageView = imageView;
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.offset = 200;
        make.top.offset = 70;
        make.centerX.equalTo(self.view);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"切换效果" forState:UIControlStateNormal];
    [btn setTitleColor:RedColor forState:UIControlStateNormal];
    btn.layer.borderColor = BlackColor.CGColor;
    btn.layer.borderWidth = 1;
    [btn addTarget:self action:@selector(itemAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset = 50;
        make.height.offset = 45;
        make.centerX.equalTo(imageView);
        make.width.offset = 160;;
    }];
}
- (void)itemAction {
    @weakify(self)
    static int num = 0;
    num++;
    switch (num) {
        case 1:
        {
            UIImage *image = [weak_self coreBlurWithNumber:.8];
            self.imageView.image = image;
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                
//            });
            
            
            break;
        }
        case 2: {
            UIImage *image = [weak_self boxBlurImageWithNumber:.34];
            self.imageView.image = image;
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                
//            });
        }
        default:
            break;
    }
    if (num > 2) {
        num = 0;
    }
}

- (UIImage *)coreBlurWithNumber:(CGFloat)blur {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:self.image.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:@(blur) forKey:@"inputRadius"];
    
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage = [UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}
- (UIImage *)boxBlurImageWithNumber:(CGFloat)blur {
    int boxSize = (int)(blur * 40);
    boxSize = boxSize - (boxSize % 2) + 1;
    CGImageRef image = self.image.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    void *pixelBuffer;
    //从CGImage中获取数据
    CGDataProviderRef inProvider = CGImageGetDataProvider(image);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    inBuffer.width = CGImageGetWidth(image);
    inBuffer.height = CGImageGetHeight(image);
    inBuffer.rowBytes = CGImageGetBytesPerRow(image);
    inBuffer.data = (void *)CFDataGetBytePtr(inBitmapData);
    pixelBuffer = malloc(CGImageGetBytesPerRow(image) * CGImageGetHeight(image));
    if (pixelBuffer == NULL) {
        NSLog(@"NO pixelbuffer");
    }
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(image);
    outBuffer.height = CGImageGetHeight(image);
    outBuffer.rowBytes = CGImageGetBytesPerRow(image);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(outBuffer.data, outBuffer.width, outBuffer.height, 8, outBuffer.rowBytes, colorSpace, kCGImageAlphaNoneSkipLast);
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);
    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    
    return returnImage;
}

@end
