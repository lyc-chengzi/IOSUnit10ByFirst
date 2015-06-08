//
//  EasyTableViewController.m
//  Unit10
//
//  Created by ESI on 15/4/13.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "EasyTableViewController.h"

@interface EasyTableViewController ()

@end

@implementation EasyTableViewController
@synthesize books;
@synthesize details;
@synthesize editingRowIndex;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    books = [NSMutableArray  arrayWithObjects:@"javaFire",@"DotNetFire",@"IOSFire",@"AndroidFire", nil];
    details = [NSMutableArray arrayWithObjects:@"java_Details",@"DotNet_Details",@"IOS_details",@"Android_details", nil];
    self.table1.dataSource = self;
    self.table1.delegate = self;
    
    //设置页眉控件
    self.table1.tableHeaderView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableHeader.png"]];
    //设置页脚控件
    self.table1.tableFooterView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tableFooter.png"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSLog(@"重新创建对象");
        switch (indexPath.row % 4) {
            case 0:
                //使用UITableViewCell创建普通单元格，使用自定义的LYCTableViewCell创建自定义单元格
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
                break;
            case 1:
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
                break;
            case 2:
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
                break;
            case 3:
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellID];
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
    cell.textLabel.text = [books objectAtIndex:rowNo];
    //为uitableviewcell左端设置图片
    cell.imageView.image = [UIImage imageNamed:@"123.png"];
    //设置左端高亮图片
    cell.imageView.highlightedImage = [UIImage imageNamed:@"123_h.png"];
    
    cell.detailTextLabel.text = [details objectAtIndex:rowNo];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.editingRowIndex = indexPath.row;
    UITableViewCell *selectedCell = [self.table1 cellForRowAtIndexPath:indexPath];
    self.bookName.text = selectedCell.textLabel.text;
    self.bookDetail.text = selectedCell.detailTextLabel.text;
}
- (IBAction)btnEdit_click:(id)sender {
    [self.books replaceObjectAtIndex:self.editingRowIndex withObject:self.bookName.text];
    
    [self.details replaceObjectAtIndex:self.editingRowIndex withObject:self.bookDetail.text];
    [self.table1 reloadData];
}

-(IBAction) hideKeyBoard:(id)sender
{
    [self.bookName resignFirstResponder];
    [self.bookDetail resignFirstResponder];
}
@end
