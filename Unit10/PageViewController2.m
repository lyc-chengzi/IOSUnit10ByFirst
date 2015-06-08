//
//  PageViewController2ViewController.m
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "PageViewController2.h"

@interface PageViewController2 ()

@end

@implementation PageViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect _rec = [[UIScreen mainScreen] bounds];
    _rec.origin.y = 64;
    self.view.frame =  _rec;
    
    LYCPageController *pageZero = [[LYCPageController alloc] initWithPageNumber:0];
    
    // Do any additional setup after loading the view.
    /*
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithInt:UIPageViewControllerSpineLocationMin],UIPageViewControllerOptionInterPageSpacingKey,
                             [NSNumber numberWithFloat:0],UIPageViewControllerOptionInterPageSpacingKey,nil];
     */
    self.dataSource = self;
    
    //设置管理的视图控制器
    [self setViewControllers:@[pageZero] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//向前翻页时调用此方法
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    LYCPageController *lycControl = (LYCPageController *)viewController;
    NSLog(@"before当前页是：%ld",(long)lycControl.pageIndex);
    if (lycControl.pageIndex > 3) {
        return nil;
    }
    if (lycControl.pageIndex > 0) {
        return [[LYCPageController alloc] initWithPageNumber:lycControl.pageIndex - 1];
    }else{
        return [[LYCPageController alloc] initWithPageNumber:lycControl.pageIndex];
    }
    
}

//向后翻页时调用次方法
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
    LYCPageController *lycControl = (LYCPageController *)viewController;
    NSLog(@"after当前页是：%ld",(long)lycControl.pageIndex);
    return [[LYCPageController alloc] initWithPageNumber:lycControl.pageIndex + 1];
}
@end
