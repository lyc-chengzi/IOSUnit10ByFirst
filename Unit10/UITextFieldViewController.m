//
//  UITextFieldViewController.m
//  Unit10
//
//  Created by ESI on 15/4/8.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "UITextFieldViewController.h"
#import "UIAlertHelper.h"

@interface UITextFieldViewController ()

@end

@implementation UITextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.txtContent.delegate = self;
    
    if (self.navigationItem != nil) {
        [self.navigationItem setTitle:@"文本框演示"];
        
        //初始化右侧导航按钮－提交按钮
        UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(registerUserHandler)];
        
        self.commitRightBI = rightBtn;
        //设置当前右侧按钮为提交按钮
        [self.navigationItem setRightBarButtonItem:self.commitRightBI];
        
        
        
        //初始化右侧导航按钮－完成按钮
        UIBarButtonItem *rightDoneBtn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(resignFirstReponderHandler)];
        self.doneRightBI = rightDoneBtn;
        
    }
    
    
    //创建一个工具条
    UIToolbar *topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    //设置工具条风格
    [topView setBarStyle:UIBarStyleDefault];
    
    //为工具条创建第一个按钮
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithTitle:@"无动作" style:UIBarButtonItemStyleBordered target:self action:nil];
    //第二个按钮，只是一个空白区
    UIBarButtonItem *btn2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    //第三个按钮，单击会触发隐藏键盘方法
    UIBarButtonItem *btn3 = [[UIBarButtonItem alloc]
                        initWithTitle:@"完成"
                        style:UIBarButtonItemStyleDone
                        target:self action:@selector(resignFirstReponderHandler)];
    
    NSArray *btnArray = [NSArray arrayWithObjects:btn1,btn2,btn3, nil];
    [topView setItems:btnArray];
    //为textview相关的虚拟键盘设置附件
    [self.txtContent setInputAccessoryView:topView];
    
    //创建两个菜单项
    UIMenuItem *item1 = [[UIMenuItem alloc] initWithTitle:@"发送邮件" action:@selector(sendMail)];
    UIMenuItem *item2 = [[UIMenuItem alloc] initWithTitle:@"分享到微博" action:@selector(shareToWeiBo)];
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    [menuController setMenuItems:[NSArray arrayWithObjects:item1,item2, nil]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//重写UIResponder的方法，返回true时会显示该Action对应的控件
-(BOOL) canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(sendMail) || action == @selector(shareToWeiBo)) {
        if (self.txtReadOnly.selectedRange.length > 0) {
            return YES;
        }
    }
    return NO;
}

//文本框开始编辑时触发
-(void) textViewDidBeginEditing:(UITextView *)textView
{
    NSLog(@"开始编辑本文域");
    if (self.navigationItem != nil)
    {
        [self.navigationItem setRightBarButtonItem:self.doneRightBI animated:NO];
    }
}

//文本框结束编辑时触发
-(void) textViewDidEndEditing:(UITextView *)textView
{
    NSLog(@"结束编辑本文域");
    [self resignFirstReponderHandler];
    if (self.navigationItem != nil)
    {
        [self.navigationItem setRightBarButtonItem:self.commitRightBI animated:NO];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//导航栏－提交按钮处理方法
- (void) registerUserHandler
{
    [self resignFirstReponderHandler];
    if ([self.txtLoginName.text isEqualToString:@""]) {
        NSLog(@"用户没有填写用户名");
        UIAlertView *alertView = [UIAlertHelper getAlertViewInstance:@"提示" message:@"用户名不能为空" delegate:nil cancelButtonTitle:@"确定" otherbuttonTitles:nil];
        [alertView show];
    }
}

//关闭键盘
- (IBAction)closeKeyBoard:(id)sender {
    [self resignFirstReponderHandler];
}

//显示或隐藏密码
- (IBAction)showPwd:(id)sender {
    UISwitch *switchView = (UISwitch *)sender;
    [self.txtPwd setSecureTextEntry:![switchView isOn]];
    
}

//隐藏键盘
-(void) resignFirstReponderHandler
{
    [self.txtLoginName resignFirstResponder];
    [self.txtPwd resignFirstResponder];
    [self.txtRePwd resignFirstResponder];
    [self.txtContent resignFirstResponder];
}

-(void) sendMail
{
    NSLog(@"模拟发送邮件");
}

-(void) shareToWeiBo
{
    NSLog(@"模拟分享到微博");
}
@end
