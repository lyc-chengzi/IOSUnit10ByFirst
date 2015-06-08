//
//  UIButtongViewController.m
//  Unit10
//
//  Created by ESI on 15/4/7.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "UIButtongViewController.h"

@implementation UIButtongViewController
UIImage *loseImage;//失败的图片
UIImage *winImage;//成功的图片
NSArray *images;//所有使用到的图片
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void) viewDidLoad
{
    NSLog(self.nibName,nil);
    
    self.lblLycName.text = [NSString stringWithFormat:@"我叫%@",self.lycName];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    //老虎机图片设置
    loseImage = [UIImage imageNamed:@"lose.png"];
    winImage = [UIImage imageNamed:@"win.png"];
    
    UIImage *dog = [UIImage imageNamed:@"dog.png"];
    UIImage *duck = [UIImage imageNamed:@"duck.png"];
    UIImage *elephant = [UIImage imageNamed:@"elephant.png"];
    UIImage *frog = [UIImage imageNamed:@"frog.png"];
    UIImage *mouse = [UIImage imageNamed:@"mouse.png"];
    UIImage *rabbit = [UIImage imageNamed:@"rabbit.png"];
    images = [NSArray arrayWithObjects:dog,duck,elephant,frog,mouse,rabbit, nil];
    
    UISegmentedControl *uis = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"消息",@"电话", nil]];
    [uis addTarget:self action:@selector(titleSegmentValueChangedHandler:) forControlEvents:UIControlEventValueChanged];
    //[uis setFrame:CGRectMake(self.view.center.x,15, 100, 30)];
    [uis setCenter: CGPointMake(self.view.center.x, 15)];
    
    //[self.view addSubview:uis];
    self.navigationItem.titleView = uis;

    
}

- (IBAction)btnClickme_click:(UIButton *)sender
{
    
    NSLog(@"我是一个按钮，我的title是：%@",[self.btnClickme titleForState:UIControlStateNormal]);
    //返回上一个view
    //[self.navigationController popViewControllerAnimated:YES];
    
    self.btnClickme.enabled=NO;
    //纪录每个随机数的出现次数
    NSMutableDictionary *result =[[NSMutableDictionary alloc] initWithCapacity:6];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"crunch" withExtension:@"wav"];
    SystemSoundID ssID;
    //装载声音文件
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &ssID);
    //播放声音
    AudioServicesPlaySystemSound(ssID);
    
    for (int i = 0; i<5; i++)
    {
        //生成0~image.count之间的随机数
        int selectedVal = arc4random() % images.count;
        
        [self.pickerView selectRow:selectedVal inComponent:i animated:YES];
        //如果这个随机数出现过
        if ([result objectForKey:[NSNumber numberWithInt:selectedVal]]) {
            //获取这个随机数出现的次数
            NSUInteger newCount = [[result objectForKey:[NSNumber numberWithInt:selectedVal]] integerValue];
            //这个随机数次数加一
            [result setObject:[NSNumber numberWithLong:(newCount+1)] forKey:[NSNumber numberWithInt:selectedVal]];
        }
        else
        {
            //这个随机数次数设为一
            [result setObject:[NSNumber numberWithLong:1] forKey:[NSNumber numberWithInt:selectedVal]];
        }
        
        
    }
    //记录随机数出现的最大次数
    NSUInteger maxOccurs = 1;
    for (NSNumber *num in [result allKeys]) {
        if ([[result objectForKey:num] integerValue] > maxOccurs) {
            maxOccurs = [[result objectForKey:num] integerValue];
        }
    }
    //如果某个随机数出现了3次以上，就判定用户赢了
    if (maxOccurs >=3) {
        [self performSelector:@selector(showWin) withObject:nil afterDelay:0.5];
    }else
    {
        [self performSelector:@selector(showLose) withObject:nil afterDelay:0.5];
    }
}

//每一列包含的项的个数
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return images.count;
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}
#define kImageTag 1

//自己定制的pick显示方式
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSLog(@"view的tag是%ld",(long)view.tag);
    if (view.tag != kImageTag) {
        view = [[UIImageView alloc] initWithImage:[images objectAtIndex:row]];
        view.tag = kImageTag;
        view.userInteractionEnabled = NO;
    }
    return view;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 40;
}

-(void)showWin
{
    NSURL *winSoundUrl = [[NSBundle mainBundle] URLForResource:@"win" withExtension:@"wav"];
    SystemSoundID ssID;
    //装载声音文件
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(winSoundUrl), &ssID);
    //播放声音
    AudioServicesPlaySystemSound(ssID);
    self.btnClickme.enabled=YES;
    NSLog(@"赢了");
    
}

-(void) showLose
{
    self.btnClickme.enabled=YES;
    NSLog(@"输了");
}

-(void) titleSegmentValueChangedHandler:(UISegmentedControl *) sender
{
    if ([sender selectedSegmentIndex]== 0 ) {
        [[[UIAlertView alloc] initWithTitle:@"title" message:@"点击了消息" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
    }
    else if ([sender selectedSegmentIndex]== 1 ) {
        [[[UIAlertView alloc] initWithTitle:@"title" message:@"点击了电话" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
    }
    
}
@end
