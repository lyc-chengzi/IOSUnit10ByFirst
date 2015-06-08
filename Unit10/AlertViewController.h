//
//  AlertViewController.h
//  Unit10
//
//  Created by ESI on 15/4/9.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertViewController : UIViewController<UIAlertViewDelegate,UIActionSheetDelegate>

//控件属性
@property (weak, nonatomic) IBOutlet UIButton *btnBasicAlert;
@property (weak, nonatomic) IBOutlet UIButton *btnOtherButtonAlert;
@property (weak, nonatomic) IBOutlet UIButton *btnInputAlter;
@property (weak, nonatomic) IBOutlet UIButton *btnAS;
@property (weak, nonatomic) IBOutlet UIWebView *WebView1;

//控件事件
- (IBAction)btnBasicAlert_click:(UIButton *)sender;
- (IBAction)btnOtherButtonAlert_click:(UIButton *)sender;
- (IBAction)btnInputAlter_click:(UIButton *)sender;
- (IBAction)btnAS_click:(id)sender;

@end
