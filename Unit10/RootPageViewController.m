//
//  RootPageViewController.m
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "RootPageViewController.h"

@interface RootPageViewController ()

@end

@implementation RootPageViewController
@synthesize pageviewModelController = _pageviewModelController;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pageviewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
        options:nil];
    self.pageviewController.dataSource = self.pageviewModelController;

    CGRect pageviewRect = self.view.bounds;
    pageviewRect.origin.y += 64;
    pageviewRect.size.height -=64;
        self.pageviewController.view.frame = pageviewRect;
    //设置第一个加载的page页
    LYCDataPageViewController *firstPage = [self.pageviewModelController dataPageViewAtIndex:0 storybord:self.storyboard];
    [self.pageviewController setViewControllers:@[firstPage] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    //将分页控制器和视图作为子类添加到当前控制器中
    [self addChildViewController:self.pageviewController];
    [self.view addSubview:self.pageviewController.view];
    
    [self.pageviewController didMoveToParentViewController:self];
    
    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
    self.view.gestureRecognizers = self.pageviewController.gestureRecognizers;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(LYCModelPageViewController *)pageviewModelController
{
    //初始化数据controller
    NSLog(@"初始化数据controller");
    if (!_pageviewModelController) {
        _pageviewModelController = [[LYCModelPageViewController alloc] init];
    }
    return _pageviewModelController;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
