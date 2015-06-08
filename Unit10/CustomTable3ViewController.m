//
//  CustomTable3ViewController.m
//  Unit10
//
//  Created by ESI on 15/4/13.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "CustomTable3ViewController.h"

@interface CustomTable3ViewController ()

@end

@implementation CustomTable3ViewController
NSArray *books;
NSArray *prices;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    books = [NSArray  arrayWithObjects:@"javaFire",@"DotNetFire",@"IOSFire",@"AndroidFire", nil];
    prices = [NSArray arrayWithObjects:@"99",@"89",@"79",@"69", nil];
    self.table1.delegate = self;
    self.table1.dataSource = self;
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
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //为cell自定义一个标识符
    static NSString *cellID = @"cellID";
    static BOOL isRegist = NO;
    if (!isRegist) {
        //加载*.xib界面设计文件
        UINib *nib = [UINib nibWithNibName:@"LYCNibTableCell" bundle:nil];
        //注册单元格
        [tableView registerNib:nib forCellReuseIdentifier:cellID];
        isRegist = YES;
    }
    LYCNibTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    NSUInteger rowNo = indexPath.row;
    cell.layer.cornerRadius = 12;
    cell.layer.masksToBounds=YES;
    cell.lblname.text = [books objectAtIndex:rowNo];
    cell.lblPrice.text = [prices objectAtIndex:rowNo];
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return books.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //定义淡绿色和淡红色
    UIColor *green = [UIColor colorWithRed:0.7 green:1.0 blue:0.7 alpha:1];
    UIColor *red = [UIColor colorWithRed:1 green:0.7 blue:0.7 alpha:1];
    cell.backgroundColor = indexPath.row % 2 == 0?green:red;
    LYCNibTableCell *thisCell = (LYCNibTableCell *) cell;
    thisCell.lblname.backgroundColor = [UIColor clearColor];
    thisCell.lblPrice.backgroundColor = [UIColor clearColor];
}
@end
