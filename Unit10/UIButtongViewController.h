//
//  UIButtongViewController.h
//  Unit10
//
//  Created by ESI on 15/4/7.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@interface UIButtongViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic) NSString *lycName;


@property (weak, nonatomic) IBOutlet UIButton *btnClickme;
- (IBAction)btnClickme_click:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCustom;
@property (weak, nonatomic) IBOutlet UILabel *lblLycName;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end
