//
//  DatePickerViewController.m
//  Unit10
//
//  Created by ESI on 15/4/9.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

NSTimer *timer;
NSInteger leftSeconds;

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //_initDate = [NSDate dateWithTimeIntervalSinceNow:-(60*60*24)];
    self->_initDate =[NSDate dateWithTimeIntervalSinceNow:-(60*60*24)];
    self.dp1.date = self->_initDate;
    
    self.dp2.datePickerMode = UIDatePickerModeCountDownTimer;
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



- (IBAction)dateValueChangedAction:(UIDatePicker *)sender {
    NSDate *selectDate = self.dp1.date;
    NSDateFormatter *df = [DateFormatterHelper getBasicFormatter];
    NSString *resultMessage = [df stringFromDate:selectDate];
    NSLog(@"选择的时期是%@",resultMessage);
}

- (IBAction)btnBegin_click:(UIButton *)sender {
    NSLog(@"start");
    
    leftSeconds = self.dp2.countDownDuration;
    
    self.dp2.enabled = NO;
    NSString *message = [NSString stringWithFormat:@"开始倒计时，还剩下%li秒",(long)leftSeconds];
    NSLog(message,nil);
    timer = [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(tickDown) userInfo:nil repeats:YES];
    
    
}

-(void) tickDown
{
    leftSeconds -= 20;
    self.dp2.countDownDuration = leftSeconds;
    NSLog(@"还剩%li秒",(long)leftSeconds);
    if (leftSeconds<=0) {
        [timer invalidate];
        self.dp2.enabled=YES;
    }
}
@end
