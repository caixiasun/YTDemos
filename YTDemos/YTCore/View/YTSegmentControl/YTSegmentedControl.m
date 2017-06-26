//
//  YTSegmentedControl.m
//  YTDemos
//
//  Created by yatou on 2017/6/7.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "YTSegmentedControl.h"

@interface YTSegmentedControl ()
{
    CGFloat  width_default;
    CGFloat  width_item;
    CGFloat  height_default;
    CGFloat  height_item;
    
    CGFloat  cornerRadius;//边框圆角
    CGFloat  width_border;//边框线宽
    CGFloat  width_separatorLine;//分隔线线宽
    UIColor  *color_separatorLine;//分隔线颜色
    UIButton *_preItem;
}

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) UIScrollView   *scrollView;

@end

@implementation YTSegmentedControl

@synthesize selectedIndex = _selectedIndex;
@synthesize color_titleNormal = _color_titleNormal;
@synthesize color_titleSelect = _color_titleSelect;
@synthesize color_border = _color_border;
@synthesize font_titleNormal = _font_titleNormal;

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.frame = CGRectZero;
        [self yts_setupUI];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.frame = CGRectZero;
        [self yts_setupUI];
    }
    return self;
}
- (instancetype)initWithWithTitles:(NSArray *)titles Delegate:(id)delegate {
    self = [super init];
    if (self) {
        
        self.frame = CGRectZero;
        self.delegate = delegate;
        self.titles = titles;
        [self yts_setupUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self yts_setupUI];
    }
    return self;
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray new];
    }
    return _items;
}
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.layer.borderWidth = width_border;
        _scrollView.layer.borderColor = self.color_border.CGColor;
        _scrollView.layer.cornerRadius = cornerRadius;
        _scrollView.layer.masksToBounds = YES;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}
- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    [self yts_addItem];
}
- (void)yts_default {
    width_default = YTScreenWidth*0.8;
    width_item = YTScreenWidth * 0.2;
    height_default = YTFitHeight(80);
    height_item = height_default;
    
    cornerRadius = 5;
    width_border = 0.5;
    width_separatorLine = 0.5;
    _color_border = BlueColor;
    color_separatorLine = [UIColor colorWithRed:.07 green:.39 blue:.84 alpha:1];
    _color_titleSelect = BlackColor;
    _color_titleNormal = GrayColor;
    _font_titleNormal = [UIFont systemFontOfSize:YTFontMaxSize(15)];
    
    _selectedIndex = 0;
    
    if (CGRectEqualToRect(CGRectZero, self.frame)) {
        self.frame = CGRectMake(0, 100, width_default, height_default);
        [self yts_setCenterX];
        height_item = self.frame.size.height;
    }
}
- (void)yts_setCenterX {
    self.centerX = YTScreenWidth * 0.5;
}
- (void)yts_appendConstraints {
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
        make.center.equalTo(self);
    }];
}
- (void)yts_setupUI {
    
    [self yts_default];
    [self yts_appendConstraints];
    [self yts_addItem];
}
- (void)yts_addItem {
    if (!self.titles || self.titles.count == 0) {
        return ;
    }
    [self.items removeAllObjects];
    
    CGFloat ii_width;
    NSString *title;
    CGFloat originX = 0.0;
    for (int i = 0; i < self.titles.count; i++) {
        title =  [self yts_intercept_title:self.titles[i]];
        UIButton *item = [UIButton new];
        item.tag = i;
        [item setTitle:title forState:UIControlStateNormal];
        [item setTitleColor:_color_titleNormal forState:UIControlStateNormal];
        [item setTitleColor:_color_titleSelect forState:UIControlStateSelected];
        item.titleLabel.font = _font_titleNormal;
        [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:item];
        [self.items addObject:item];
        ii_width = [self widthWithTitle:title];
        [item mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(ii_width, height_item));
            make.centerY.equalTo(self);
            make.left.offset = originX;
        }];
        originX += ii_width;
        if (i < self.titles.count-1) {
            UIView *line = [UIView new];
            line.backgroundColor = color_separatorLine;
            [self.scrollView addSubview:line];
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(item.mas_right);
                make.height.centerY.equalTo(item);
                make.width.offset = width_separatorLine;
            }];
            originX += width_separatorLine;
        }
        if (i == 0) {
            _preItem = item;
            item.selected = YES;
        }
    }
    if (originX < CGRectGetWidth(self.frame)) {
        CGRect frame = self.frame;
        frame.size.width = originX;
        self.frame = frame;
    }
    [self.scrollView setContentSize:CGSizeMake(originX, CGRectGetHeight(self.frame))];
    [self yts_setCenterX];
}
- (NSString *)yts_intercept_title:(NSString *)title {
    if (title.length > 6) {
        title = [title substringToIndex:6];
    }
    return title;
}
- (CGFloat)widthWithTitle:(NSString *)title {

    CGSize size = [title boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.frame), height_item) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:_font_titleNormal} context:nil].size;
    
    return size.width + YTFitWidth(50);
}
- (void)itemAction:(UIButton *)item {
    _preItem.selected = NO;
    item.selected = YES;
    _preItem = item;
    if (self.delegate && [self.delegate respondsToSelector:@selector(segmented:didSelectItemAtIndex:)]) {
        [self.delegate segmented:self didSelectItemAtIndex:item.tag];
    }
}
- (void)setSelectedIndex:(NSInteger)selectedIndex {
    if (!self.items || selectedIndex >= self.items.count) {
        return ;
    }
    _selectedIndex = selectedIndex;
    _preItem.selected = NO;
    _preItem = [self.items objectAtIndex:_selectedIndex];
    _preItem.selected = YES;
    if (self.delegate && [self.delegate respondsToSelector:@selector(segmented:didSelectItemAtIndex:)]) {
        [self.delegate segmented:self didSelectItemAtIndex:_selectedIndex];
    }
}
- (NSInteger)selectedIndex {
    return _selectedIndex;
}
- (NSInteger)numberOfItems {
    return self.titles.count;
}
- (void)setColor_titleNormal:(UIColor *)color_titleNormal {
    _color_titleNormal = color_titleNormal;
    [self reloadData];
}
- (void)setColor_titleSelect:(UIColor *)color_titleSelect {
    _color_titleSelect = color_titleSelect;
    [self reloadData];
}
- (void)setFont_titleNormal:(UIFont *)font_titleNormal {
    _font_titleNormal = font_titleNormal;
    [self reloadData];
}
- (void)reloadData {
    for (UIButton *item in self.items) {
        [item setTitleColor:_color_titleNormal forState:UIControlStateNormal];
        [item setTitleColor:_color_titleSelect forState:UIControlStateSelected];
        item.titleLabel.font = _font_titleNormal;
    }
}

@end
