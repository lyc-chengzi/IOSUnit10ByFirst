//
//  LycCollectionLayout.m
//  Unit10
//
//  Created by ESI on 15/4/15.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "LycCollectionLayout.h"
#define ITEM_SIZE 72
@implementation LycCollectionLayout

//开始执行的方法
-(void)prepareLayout
{
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    //计算要包含多少个单元格
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    
    //计算圆心
    _center = CGPointMake(size.width / 2.0, size.height / 2.0);
    
    //计算圆的半径
    _radius = MIN(size.width, size.height) / 2.5;
    
    
}

//该方法的返回值决定网格所包含控件大小
-(CGSize)collectionViewContentSize
{
    return [self collectionView].frame.size;
}

//该方法返回的值控制指定单元格的大小和位置
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建一个网格属性对象
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //设置单元格大小
    attr.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    //设置单元格中心点坐标
    attr.center = CGPointMake(_center.x + _radius * cosf(2 * M_PI * indexPath.item / _cellCount), _center.y + _radius * sinf(2 * M_PI * indexPath.item / _cellCount));
    
    return attr;
}

//该方法返回值控制UICollectionViewLayoutAttributes 集合依次控制制定cgrect范围内各个单元格的大小和位置
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attrs = [NSMutableArray array];
    //将控制每个单元格大小和位置的attribute添加到集合中
    for (NSInteger i = 0; i < _cellCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attrs addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attrs;
}

//每当单元格动态显示时自动调用该方法
-(UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attrs.alpha = 0;
    attrs.center = CGPointMake(_center.x, _center.y);
    return attrs;
}

//每当单元格动态消失时自动调用
-(UICollectionViewLayoutAttributes *) finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attrs.alpha = 0;
    attrs.center = CGPointMake(_center.x, _center.y);
    attrs.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
    return attrs;
}


@end
