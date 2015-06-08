//
//  ImageViewController.h
//  Unit10
//
//  Created by ESI on 15/4/9.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController

//控件属性
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIButton *btnPlus;
@property (weak, nonatomic) IBOutlet UIButton *btnMinus;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;

//控件事件
- (IBAction)plusAction:(id)sender;
- (IBAction)minusAction:(id)sender;
- (IBAction)nextAction:(id)sender;
- (IBAction)playAction:(id)sender;
- (IBAction)pauseAction:(id)sender;

@end
