//
//  ICarouselDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/5/31.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "ICarouselDemoController.h"

@interface ICarouselDemoController () <iCarouselDelegate, iCarouselDataSource>
{
    CGSize _itemSize;
}

@property (nonatomic, strong) iCarousel *icarousel;
@property (nonatomic, strong) NSArray   *colors;

@end

@implementation ICarouselDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _itemSize = CGSizeMake(self.view.frame.size.width*0.7, YTFitHeight(300));
    self.colors = @[RedColor, GreenColor, BlueColor, YellowColor, GrayColor];
    
    [self setupUI];
}

- (void)setupUI {
    
    UILabel *perspectiveLab = [UILabel new];
    perspectiveLab.text = @"Perspective";
    perspectiveLab.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:perspectiveLab];
    [perspectiveLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset = YTFitWidth(20);
        make.top.offset = 20 + 64;
    }];
    
    UISlider *perspectiveSlider = [UISlider new];
    perspectiveSlider.tag = 1;
    [perspectiveSlider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:perspectiveSlider];
    [perspectiveSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(perspectiveLab.mas_right).offset = 10;
        make.centerY.equalTo(perspectiveLab);
        make.right.offset = -YTFitWidth(20);
    }];
    
    [self.icarousel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset = _itemSize.height;
        make.width.equalTo(self.view);
        make.centerX.equalTo(self.view);
        make.bottom.offset = -YTFitHeight(40);
//        make.centerY.equalTo(self.view);
    }];
}

- (iCarousel *)icarousel {
    if (!_icarousel) {
        _icarousel = [iCarousel new];
        _icarousel.delegate = self;
        _icarousel.dataSource = self;
        _icarousel.pagingEnabled = YES;
//        _icarousel.bounces = NO;
        _icarousel.type = 11;
//        _icarousel.centerItemWhenSelected = NO;
//        _icarousel.vertical = YES;
//        _icarousel.ignorePerpendicularSwipes = NO;
        [self.view addSubview:_icarousel];
    }
    return _icarousel;
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.colors.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {
    if (!view) {
        view = [UIView new];
        view.bounds = CGRectMake(0, 0, _itemSize.width, _itemSize.height);
        view.layer.cornerRadius = 10;
        view.layer.masksToBounds = YES;
    }
    view.backgroundColor = self.colors[index];
    return view;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    DLog(@"____index = %ld",index);
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    DLog(@"____current index = %ld",carousel.currentItemIndex);
    
    for (UIView *vv in carousel.visibleItemViews) {
        DLog(@"____color = %@",vv.backgroundColor);
    }
//    DLog(@"____________views = %@",carousel.visibleItemViews);
}


- (void)sliderAction:(UISlider *)slider {
    DLog(@"____________value = %f",slider.value);
    switch (slider.tag) {
        case 1:
//            self.icarousel.perspective = -slider.value/100;//perspective
//            self.icarousel.viewpointOffset = CGSizeMake(slider.value, slider.value*200);
            self.icarousel.decelerationRate = slider.value;
            self.icarousel.bounceDistance = 1 - slider.value;
            break;
            
        default:
            break;
    }
}
- (CGFloat)carouselItemWidth:(iCarousel *)carousel {
    return _itemSize.width + 50;
}
- (void)carouselDidScroll:(iCarousel *)carousel {
    for (UIView *vvv in carousel.visibleItemViews) {
        vvv.alpha = 0.3;
    }
    [carousel currentItemView].alpha = 1;
}
- (CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform {
    transform = CATransform3DIdentity;
    static CGFloat max_scale = 1.0f;
    static CGFloat min_scale = 0.6f;
    
    if (offset <= 1 && offset >= -1) {
        float tempScale = offset < 0 ? 1 + offset : 1 - offset;
        float slope = (max_scale - min_scale) / 1;
        CGFloat scale = min_scale + slope * tempScale;
        transform = CATransform3DScale(transform, scale, scale, 1);
    }else {
        transform = CATransform3DScale(transform, min_scale, min_scale, 1);
    }
    return CATransform3DTranslate(transform, offset * carousel.itemWidth * 1.2, 0.0, 0.0);
}

@end
