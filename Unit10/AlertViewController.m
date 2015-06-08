//
//  AlertViewController.m
//  Unit10
//
//  Created by ESI on 15/4/9.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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

- (IBAction)btnBasicAlert_click:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"我是普通弹出框" message:@"随便说点什么吧" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
- (IBAction)btnOtherButtonAlert_click:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"我是多按钮弹出框" message:@"你喜欢以下哪种开发？" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@".NET",@"JAVA",@"IOS",nil];
    [alert show];
}
- (IBAction)btnInputAlter_click:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"我是文本框弹出框" message:@"请先登录" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"取消",nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alert show];
}

- (IBAction)btnAS_click:(id)sender {
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"你要学习ios嘛？" delegate:self cancelButtonTitle:@"不想" destructiveButtonTitle:@"是的" otherButtonTitles:@"再考虑一下",@"看情况", nil];
    [as showInView:self.view];
}

//实现uiactionsheet协议中的方法
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"你点击了第%ld个按钮",(long)buttonIndex);
}

-(void) actionSheetCancel:(UIActionSheet *)actionSheet
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"我是普通弹出框" message:@"你点击了取消按钮，那我就什么都不需要做了" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

//实现alert协议中的方法
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *alertMessage = [NSString stringWithFormat:@"您选中了第%ld个按钮",(long)buttonIndex];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您的选择结果是" message:alertMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];

    [alert show];
}
@end
