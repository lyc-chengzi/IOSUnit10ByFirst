//
//  LYCPageController.m
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "LYCPageController.h"

@interface LYCPageController ()

@end

@implementation LYCPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _contentList = [NSArray arrayWithObjects:@"java",@".net",@"ios",@"C", nil];
    _coverList = [NSArray arrayWithObjects:@"mouse.png",@"duck.png",@"dog.png",@"rabbit.png", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id) initWithPageNumber:(NSInteger)pageNumber
{
    self.pageIndex = pageNumber;
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(260, 10, 60, 30)];
        self.label.backgroundColor = [UIColor clearColor];
        self.label.text = [NSString stringWithFormat:@"第%ld页",pageNumber + 1];
        [self.view addSubview:self.label];
        
        
        self.bookName = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, CGRectGetWidth(self.view.frame), 60)];
        self.bookName.textAlignment = NSTextAlignmentCenter;
        self.bookName.numberOfLines = 2;
        self.bookName.font = [UIFont systemFontOfSize:24];
        self.bookName.backgroundColor = [UIColor clearColor];
        self.bookName.textColor = [UIColor blueColor];
        //设置默认书名
        self.bookName.text = [_contentList objectAtIndex:pageNumber % 4];
        [self.view addSubview:self.bookName];
        
        self.bookImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 90, CGRectGetWidth(self.view.frame), 320)];
        //设置默认图片
        self.bookImage.image = [UIImage imageNamed:[_coverList objectAtIndex:pageNumber % 4]];
        self.bookImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:self.bookImage];
    }
    return self;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
