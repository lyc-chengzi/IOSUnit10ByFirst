//
//  RootPageViewController.h
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYCModelPageViewController.h"

@interface RootPageViewController : UIViewController
@property (readonly,strong,nonatomic) LYCModelPageViewController *pageviewModelController;
@property (strong, nonatomic) UIPageViewController *pageviewController;
@end
