//
//  ViewController.m
//  Unit10
//
//  Created by ESI on 15/4/7.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"设置左侧按钮");
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    NSArray *array = [[NSArray alloc] initWithObjects:button1, nil];
    self.navigationItem.leftBarButtonItems = array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
