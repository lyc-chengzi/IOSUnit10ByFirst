//
//  CustomTable2ViewController.m
//  Unit10
//
//  Created by ESI on 15/4/13.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "CustomTable2ViewController.h"

@interface CustomTable2ViewController ()

@end
NSMutableArray *books;
@implementation CustomTable2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    books = [NSMutableArray  arrayWithObjects:@"javaFire",@"DotNetFire",@"IOSFire",@"AndroidFire", nil];
    self.tabel1.dataSource = self;
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return books.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取行号
    NSInteger rowNo = indexPath.row;
    NSString *identifier = rowNo % 2 ==0 ?@"Cell1":@"Cell2";
    UITableViewCell *cell = [self.tabel1 dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:2];
    label.text=[books objectAtIndex:rowNo];
    return cell;
    
}
@end
