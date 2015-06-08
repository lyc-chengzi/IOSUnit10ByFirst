//
//  ProgressViewController.h
//  Unit10
//
//  Created by ESI on 15/4/9.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressViewController : UIViewController

//控件属性
@property (weak, nonatomic) IBOutlet UIProgressView *pv1;
@property (weak, nonatomic) IBOutlet UIProgressView *pv2;
@property (weak, nonatomic) IBOutlet UIProgressView *pv3;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *av1;
@property (weak, nonatomic) IBOutlet UIButton *btnLoad;

//控件事件
- (IBAction)btnLoad_click:(id)sender;

@end
