//
//  DatePickerViewController.h
//  Unit10
//
//  Created by ESI on 15/4/9.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateFormatterHelper.h"

@interface DatePickerViewController : UIViewController
{
    NSDate *_initDate;
}
@property (weak, nonatomic) IBOutlet UIDatePicker *dp1;
@property (weak, nonatomic) IBOutlet UIDatePicker *dp2;
@property (weak, nonatomic) IBOutlet UIButton *btnBegin;
- (IBAction)dateValueChangedAction:(UIDatePicker *)sender;
- (IBAction)btnBegin_click:(UIButton *)sender;

@end
