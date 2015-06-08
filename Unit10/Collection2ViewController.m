//
//  Collection2ViewController.m
//  Unit10
//
//  Created by ESI on 15/4/15.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "Collection2ViewController.h"

@interface Collection2ViewController ()

@end

@implementation Collection2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _cellCount = 16;
    LycCollectionLayout *lycLayout = [[LycCollectionLayout alloc] init];
    self.grieview.collectionViewLayout = lycLayout;
    
    //设置背景色
    self.grieview.backgroundColor = [UIColor grayColor];
    self.grieview.dataSource = self;
    self.grieview.delegate = self;
    
    //创建一个处理点击手势的处理器
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    
    [self.grieview addGestureRecognizer:tapRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _cellCount;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cID = @"cellID";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cID forIndexPath:indexPath];
    return cell;
}

-(void)tapHandler:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded) {
        //获取点击的位置
        CGPoint p = [sender locationInView:self.grieview];
        //获取点击区域的NSIndexPath
        NSIndexPath *tappedcellpath = [self.grieview indexPathForItemAtPoint:p];
        
        //如果被点击的cell存在
        if (tappedcellpath) {
            _cellCount --;
            //删除选中的cell
            [self.grieview deleteItemsAtIndexPaths:[NSArray arrayWithObject:tappedcellpath]];
        }else{
            _cellCount ++;
            //在开始位置添加一个cell
            [self.grieview insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
        }
    }
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
