//
//  CollectionView_ScrollViewDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/13.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "CollectionView_ScrollViewDemoController.h"
#import "CollectionViewDemoCell.h"

@interface CollectionView_ScrollViewDemoController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation CollectionView_ScrollViewDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat interim_space = YTFitWidth(30);
        CGFloat line_space = YTFitHeight(20);
        CGFloat width = floor((YTScreenWidth-4*interim_space)/3);
        CGFloat height = YTFitHeight(300);
        layout.itemSize = CGSizeMake(width, height);
        layout.sectionInset = UIEdgeInsetsMake(0, interim_space, 0, interim_space);
        layout.minimumInteritemSpacing = interim_space;
        layout.minimumLineSpacing = line_space;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        [_collectionView registerClass:[CollectionViewDemoCell class] forCellWithReuseIdentifier:@"CollectionViewDemoCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 13;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewDemoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewDemoCell" forIndexPath:indexPath];
    
    return cell;
}

@end
