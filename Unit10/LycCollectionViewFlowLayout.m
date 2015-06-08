//
//  LycCollectionViewFlowLayout.m
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "LycCollectionViewFlowLayout.h"

@implementation LycCollectionViewFlowLayout
#define ACTIVE_DISTANCE 200
#define ZOOM_FACTOR 0.5

-(id)init
{
    self = [super init];
    if (self) {
        //设置每个单元格的大小
        self.itemSize = CGSizeMake(154, 200);
        //设置控件的滚动方向
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(120, 0.0, 120, 0);
        //设置单元格之间最小的行间距
        self.minimumLineSpacing = 50;
    }
    return self;
}
//bounds改变时，是否需要重新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

//该方法的返回值控制指定cgrect区域内各个单元格的大小。位置等布局属性
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    //定义一个CGRect，用于记录该UICollectionView的可视区域
    CGRect visibleRect;
    visibleRect.origin = self.collectionView.contentOffset;
    //设置visibleRect的大小与contentView的大小相同
    visibleRect.size = self.collectionView.bounds.size;
    
    for (UICollectionViewLayoutAttributes * attr in array) {
        if (CGRectIntersectsRect(attr.frame, rect)) {
            //用可是区域的中心减去当前单元控件的中心，得到该单元格与中心的距离
            CGFloat distance = CGRectGetMidX(visibleRect) - attr.center.x;
            //如果该单元格与中心的距离小于指定值，就对该控件进行放大
            if (ABS(distance) < ACTIVE_DISTANCE) {
                //计算放大比例:该单元格与中心距离越大，放大比例越小
                CGFloat zoom = 1+ZOOM_FACTOR * (1 - ABS(distance / ACTIVE_DISTANCE));
                
                //设置对单元格在X方向、Y方向上放大zoom倍
                attr.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
                attr.zIndex = 1;
                
            }
            
        }
    }
    
    return array;
}
@end
