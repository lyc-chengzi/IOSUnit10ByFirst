//
//  ListViewController.m
//  Unit10
//
//  Created by ESI on 15/4/9.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.backBarButtonItem = backBtn;
    
    
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
//跳转前的处理方法
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue的id是：%@",segue.identifier);
    if ([segue.identifier  isEqual: @"ToUIButton"]) {
        [[segue destinationViewController] setValue:@"刘一呈" forKey:@"lycName"];
    }
        /*
     获取某个storyboard的viewcontroller
    UIStoryboard *msb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AlertViewController *avc = [msb instantiateViewControllerWithIdentifier:@"viewID"];
    [avc setValue:@"haha" forKey:@"name"];
     */
}


@end
