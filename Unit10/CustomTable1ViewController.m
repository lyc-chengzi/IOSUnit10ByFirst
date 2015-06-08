//
//  CustomTable1ViewController.m
//  Unit10
//
//  Created by ESI on 15/4/13.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "CustomTable1ViewController.h"

@interface CustomTable1ViewController ()

@end
NSMutableArray *books;
NSMutableArray *details;
@implementation CustomTable1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    books = [NSMutableArray  arrayWithObjects:@"javaFire",@"DotNetFire",@"IOSFire",@"AndroidFire", nil];
    details = [NSMutableArray arrayWithObjects:@"java_Details",@"DotNet_Details",@"IOS_details",@"Android_details", nil];
    self.table1.dataSource = self;
    self.table1.delegate = self;
    self.table1.separatorStyle = UITableViewCellSeparatorStyleNone;
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

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return books.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //为表格行定义一个静态字符串作为标示
    static NSString *cellID = @"cellId";
    NSLog(@"hanghao:%ld",(long)indexPath.row);
    //从可重用的表格行的队列中取出一个表格行
    LYCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSLog(@"重新创建对象");
        switch (indexPath.row % 4) {
            case 0:
                //使用UITableViewCell创建普通单元格，使用自定义的LYCTableViewCell创建自定义单元格
                cell = [[LYCTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
                break;
            case 1:
                cell = [[LYCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
                break;
            case 2:
                cell = [[LYCTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
                break;
            case 3:
                cell = [[LYCTableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellID];
                break;
            default:
                break;
        }
    }
    //单元格设为圆角
    cell.layer.cornerRadius = 12;
    cell.layer.masksToBounds = YES;
    
    //获取当前的行号
    NSUInteger rowNo = indexPath.row;
    cell.nameLabel.text = [books objectAtIndex:rowNo];
    cell.priceLabel.text = @"99";
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


@end
