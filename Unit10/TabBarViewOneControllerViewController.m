//
//  TabBarViewOneControllerViewController.m
//  Unit10
//
//  Created by ESI on 15/4/8.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "TabBarViewOneControllerViewController.h"

@interface TabBarViewOneControllerViewController ()

@end

@implementation TabBarViewOneControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBarController setSelectedIndex:0];
    // Do any additional setup after loading the view.
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"消息2" image:[UIImage imageNamed:@"321.png"] tag:101];
    item.badgeValue = @"5";
    self.tabBarItem = item;
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

@end
