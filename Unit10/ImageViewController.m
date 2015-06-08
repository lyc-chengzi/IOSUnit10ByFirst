//
//  ImageViewController.m
//  Unit10
//
//  Created by ESI on 15/4/9.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController
NSArray *images;
int curimage;
CGFloat alpha;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    curimage = 0;
    alpha = 1.0;
    images = [NSArray arrayWithObjects:@"123.png",@"321.png", nil];
    //启用image1的用户交互
    self.imageView1.userInteractionEnabled = YES;
    //创建一个轻击的手势检测器
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clicked:)];
    //为image1添加刚刚创建的手势检测器
    [self.imageView1 addGestureRecognizer:singleTap];
    
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


//自定义手势检测器的轻击事件


//控件事件
- (IBAction)plusAction:(id)sender {
    alpha+=0.02;
    if (alpha>1.0) {
        alpha = 1.0;
    }
    self.imageView1.alpha = alpha;
}

- (IBAction)minusAction:(id)sender {
    alpha -= 0.02;
    if (alpha < 0) {
        alpha = 0;
    }
    self.imageView1.alpha = alpha;
}

- (IBAction)nextAction:(id)sender {
    self.imageView1.image = [UIImage imageNamed:[images objectAtIndex:++curimage % images.count]];
    
}
//播放
- (IBAction)playAction:(id)sender {
    NSArray *imagePlayList = [NSArray arrayWithObjects:
                              [UIImage imageNamed:@"123.png"],
                              [UIImage imageNamed:@"321.png"], nil];
    self.imageView1.animationImages = imagePlayList;
    self.imageView1.animationDuration = 12;
    self.imageView1.animationRepeatCount = 99;
    [self.imageView1 startAnimating];
}
//停止播放
- (IBAction)pauseAction:(id)sender {
    if (self.imageView1.isAnimating) {
        [self.imageView1 stopAnimating];
    }
}

//手势检测器的轻击事件处理方法
-(void) clicked:(UIGestureRecognizer *) gestureRe
{
    UIImage *srcImage = self.imageView1.image;
    //获取用户手指在原图上的触碰点
    CGPoint pt = [gestureRe locationInView:self.imageView1];
    //获取正在显示的原图对应的CGImageRef
    CGImageRef sourceImageRef = [srcImage CGImage];
    //获取图片世纪大小与第一个UIImageView的缩放比例
    CGFloat scale = srcImage.size.width / 320;
    //将image1伤的触碰点的左边换算成原图上的位置
    CGFloat x = pt.x *scale;
    CGFloat y = pt.y * scale;
    if (x+120 > srcImage.size.width) {
        x = srcImage.size.width - 140;
    }
    if (y+120 > srcImage.size.height) {
        y = srcImage.size.height - 140;
    }
    //调用CGImageCreateWithImageInRect函数获取SoureImageRef中指定区域的图片
    CGImageRef newImageref = CGImageCreateWithImageInRect(sourceImageRef, CGRectMake(x, y, 140, 140));
    self.imageView2.image = [UIImage imageWithCGImage:newImageref];
}
@end
