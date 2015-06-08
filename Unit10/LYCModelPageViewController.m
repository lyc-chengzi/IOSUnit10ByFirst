//
//  LYCModelPageViewController.m
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//  分页控制器－－模型实现类

#import "LYCModelPageViewController.h"

@implementation LYCModelPageViewController
@synthesize animalName = _animalName;
@synthesize animalImage = _animalImage;
-(instancetype)init
{
    self = [super init];
    if (self) {
        _animalName = [NSArray arrayWithObjects:@"大象",@"老鼠",@"鸭子",@"小狗",@"兔子", nil];
        _animalImage = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"elephant.png"],
                        [UIImage imageNamed:@"mouse.png"],
                        [UIImage imageNamed:@"duck.png"],
                        [UIImage imageNamed:@"dog.png"],
                        [UIImage imageNamed:@"rabbit.png"],
                        nil];
    }
    return self;
}

//向后翻页
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    LYCDataPageViewController *dpv = (LYCDataPageViewController *)viewController;
    NSInteger cIndex = dpv.currentPageIndex;
    if (cIndex == NSNotFound) {
        return nil;
    }
    cIndex++;
    if (cIndex >= _animalImage.count) {
        return nil;
    }
    
    return [self dataPageViewAtIndex:cIndex storybord:viewController.storyboard];
}

//向前翻页
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    LYCDataPageViewController *dpv = (LYCDataPageViewController *)viewController;
    NSInteger cIndex = dpv.currentPageIndex;
    if (cIndex == NSNotFound) {
        return nil;
    }
    cIndex--;
    if (cIndex < 0) {
        return nil;
    }
    return [self dataPageViewAtIndex:cIndex storybord:viewController.storyboard];
}

-(LYCDataPageViewController *)dataPageViewAtIndex:(NSInteger)index storybord:(UIStoryboard*) storyBoard
{
    LYCDataPageViewController *dpv = [storyBoard instantiateViewControllerWithIdentifier:@"dataView"];
    dpv.animalName = self.animalName[index];
    dpv.animalImage = self.animalImage[index];
    [dpv setPageIndex:index];
    return dpv;
}
@end
