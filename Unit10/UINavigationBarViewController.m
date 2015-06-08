//
//  UINavigationBarViewController.m
//  Unit10
//
//  Created by ESI on 15/4/7.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "UINavigationBarViewController.h"

@interface UINavigationBarViewController ()

@end

@implementation UINavigationBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNaviBarItem];
    [self.WebView1 loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.ganji.com"]]];
    self.WebView1.delegate=self;
    [self.aiv1 setCenter:self.view.center];
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

-(void) initNaviBarItem
{
    [self.navigationItem setTitle:@"UINavigationItem"];
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemCancel target:self action:@selector(RightNItem_click)];
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithTitle:@"后退" style:UIBarButtonItemStyleBordered target:self action:@selector(webGoBack)];
    rightBar.title=@"添加";
    [self.navigationItem setRightBarButtonItem:rightBar];
    [self.navigationItem setLeftBarButtonItem:leftBar];
    
    NSLog(@"是否是同一个导航栏%i",[self.navigationItem isEqual:self.NbItem]);
}

-(void) RightNItem_click
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)webGoBack
{
    [self.WebView1 goBack];
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"页面加载完成");
    [self.aiv1 stopAnimating];
}
@end
