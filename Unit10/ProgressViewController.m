//
//  ProgressViewController.m
//  Unit10
//
//  Created by ESI on 15/4/9.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "ProgressViewController.h"

@interface ProgressViewController ()

@end

NSTimer *timer;
CGFloat curProssVal;
@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建可拉伸图片，进行整体平铺
    UIImage *trackImage = [[UIImage imageNamed:@"123.png"] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
    
    UIImage *progressImage = [[UIImage imageNamed:@"321.png"] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
    self.pv3.trackImage = trackImage;
    self.pv3.progressImage = progressImage;
    
    curProssVal = 0;
    self.av1.hidesWhenStopped = true;
    
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

- (IBAction)btnLoad_click:(id)sender
{
    curProssVal = 0;
    
    [self.av1 startAnimating];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(changeProgress) userInfo:nil repeats:YES];
}

-(void) changeProgress
{
    curProssVal += 0.01;
    if (curProssVal >= 1) {
        [self.av1 stopAnimating];
        [timer invalidate];
    }else{
        [self.pv1 setProgress:curProssVal animated:YES];
        [self.pv2 setProgress:curProssVal animated:YES];
        [self.pv3 setProgress:curProssVal animated:YES];
    }
}
@end
