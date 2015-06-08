//
//  LYCModelPageViewController.h
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//  分页控制器－－模型实现类

#import <WebKit/WebKit.h>
#import "LYCDataPageViewController.h"

@interface LYCModelPageViewController : NSObject<UIPageViewControllerDataSource>
@property (readonly,strong, nonatomic) NSArray *animalName;
@property (readonly,strong, nonatomic) NSArray *animalImage;
-(LYCDataPageViewController *) dataPageViewAtIndex:(NSInteger) index storybord:(UIStoryboard*) storyBoard;

@end
