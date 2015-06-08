//
//  UITextFieldViewController.h
//  Unit10
//
//  Created by ESI on 15/4/8.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextFieldViewController : UIViewController<UITextViewDelegate>
//属性
@property (strong,nonatomic) UIBarButtonItem *doneRightBI;//右侧导航条按钮－完成
@property (strong,nonatomic) UIBarButtonItem *commitRightBI;//右侧导航条按钮-提交

//控件变量
@property (weak, nonatomic) IBOutlet UITextField *txtLoginName;
@property (weak, nonatomic) IBOutlet UITextField *txtPwd;
@property (weak, nonatomic) IBOutlet UITextField *txtRePwd;
@property (weak, nonatomic) IBOutlet UITextView *txtContent;
@property (weak, nonatomic) IBOutlet UITextView *txtReadOnly;

- (IBAction)closeKeyBoard:(id)sender;
- (IBAction)showPwd:(id)sender;

@end
