//
//  ManySectionsViewController.m
//  Unit10
//
//  Created by ESI on 15/4/14.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "ManySectionsViewController.h"

@interface ManySectionsViewController ()

@end

@implementation ManySectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化表格数据
    _tableData = [NSMutableDictionary dictionaryWithObjects:
                  [NSMutableArray arrayWithObjects:
                   [NSMutableArray arrayWithObjects:@"孙悟空",@"猪八戒",@"牛魔王",@"蜘蛛精",@"唐僧",@"沙和尚", nil],
                   [NSMutableArray arrayWithObjects:@"贾宝玉",@"王熙凤",@"林黛玉",@"薛宝钗",@"惜春",@"探春", nil],
                   [NSMutableArray arrayWithObjects:@"宋江",@"吴用",@"武松",@"李逵",@"林冲",@"鲁智深", nil],
                   [NSMutableArray arrayWithObjects:@"刘备",@"张飞",@"关羽",@"赵云",@"马超",@"吕布", nil],nil]
                  forKeys:
                    [NSMutableArray arrayWithObjects:@"西游记",@"红楼梦",@"水浒传",@"三国演义",nil]];
    _stories = [[_tableData allKeys] sortedArrayUsingSelector:@selector(compare:)];
    //测试数据
    NSLog(@"西游记的第一个人物是：%@",[(NSArray *)[_tableData objectForKey:@"西游记"] objectAtIndex:0]);
    
    //self.table1.dataSource = self;
    //self.table1.delegate = self;
    
    //初始化刷新控件
    self.refreshCtrl = [[UIRefreshControl alloc] init];
    
    self.refreshCtrl.tintColor = [UIColor grayColor];
    //设置控件的提示标题
    self.refreshCtrl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下啦刷新"];
    //设置刷新处理事件
    [self.refreshCtrl addTarget:self action:@selector(refreshHandler) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = self.refreshCtrl;
    
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

//设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *storyName = [_stories objectAtIndex:section];
    //return ((NSArray *)[_tableData objectForKey:storyName]).count;
    return [[_tableData objectForKey:storyName] count];
}

//设置单元格展示
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowNo = indexPath.row;//获取行号
    NSInteger sectionNo = indexPath.section;//获取分区号
    
    NSString *storyName = [_stories objectAtIndex:sectionNo];
    
    static NSString *cellID = @"cID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.layer.cornerRadius = 12;
    cell.layer.masksToBounds = YES;
    cell.textLabel.text = [[_tableData objectForKey:storyName] objectAtIndex:rowNo];
    switch (sectionNo) {
        case 0:
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            break;
        case 1:
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
            break;
        case 2:
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            break;
        case 3:
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        default:
            cell.accessoryType = UITableViewCellAccessoryNone;
            break;
    }
    
    return  cell;
}

//设置分区数量
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _stories.count;
}

//实现协议方法，在右边显示一列浮动的索引
//-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return _stories;
//}

//返回指定分区的页眉
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_stories objectAtIndex:section];
    
}

//返回指定分区页脚
/*
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    
    NSString *storyName = [_stories objectAtIndex:section];
    return [NSString stringWithFormat:@"一共有%lu个人物",(unsigned long)[[_tableData objectForKey:storyName] count]];
}
*/
-(void)refreshHandler
{
    NSLog(@"准备刷新啦");
    self.refreshCtrl.attributedTitle = [[NSAttributedString alloc] initWithString:@"正在刷新"];
    [self performSelector:@selector(lodingData) withObject:nil afterDelay:2];
}

-(void) lodingData
{
    NSString *randStr = [NSString stringWithFormat:@"%d",arc4random() % 10000];
    NSMutableArray *aa = [_tableData objectForKey:@"三国演义"];
    [aa addObject:randStr];
    
    [self.refreshCtrl endRefreshing];
    [self.tableView reloadData];
}

@end
