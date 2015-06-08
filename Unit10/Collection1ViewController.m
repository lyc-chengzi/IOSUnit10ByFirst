//
//  Collection1ViewController.m
//  Unit10
//
//  Created by ESI on 15/4/15.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "Collection1ViewController.h"

@interface Collection1ViewController ()

@end

@implementation Collection1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _books = [NSArray arrayWithObjects:@"大象",@"服了",@"老鼠",@"鸭子",@"小狗",@"兔子", nil];
    _covers = [NSArray arrayWithObjects:@"elephant.png",@"frog.png",@"mouse.png",@"duck.png",@"dog.png",@"rabbit.png", nil];
    self.navigationItem.title = @"简单网格演示";
    self.gridView.delegate = self;
    self.gridView.dataSource = self;
    
    //创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //设置网格单元格大小
    flowLayout.itemSize = CGSizeMake(120, 160);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置各个分区上下左右空白
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 2, 0, 2);
    self.gridView.collectionViewLayout = flowLayout;
    
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

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cID = @"cellID";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cID forIndexPath:indexPath];
    //因为已在设计页面上拖放了一个cell对象，也可以像tableviewcell那样用nib文件定义，实现方法一致
    cell.layer.cornerRadius = 8;
    cell.layer.masksToBounds = YES;
    NSInteger rowNO = indexPath.row;
    //获取单元格内的image图片
    UIImageView *iv = (UIImageView *)[cell viewWithTag:2];
    iv.image = [UIImage imageNamed:[_covers objectAtIndex:rowNO]];
    //获取单元格的label控件
    UILabel *lable = (UILabel *)[cell viewWithTag:1];
    lable.text = [_books objectAtIndex:rowNO];
    return cell;
}

//返回网格包含多少个item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _books.count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath

{
    NSLog(@"你选中了第%ld个item",(long)indexPath.row);
}


@end
