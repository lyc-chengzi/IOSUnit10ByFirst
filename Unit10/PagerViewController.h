//
//  PagerViewController.h
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYCPageController.h"

@interface PagerViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    NSMutableArray *_viewControllers;
    UIPageControl *_pagecontrol;
    NSArray *_contentList;
    NSArray *_coverList;
}
@end
