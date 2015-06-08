//
//  AddTableViewController.m
//  Unit10
//
//  Created by ESI on 15/4/14.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "AddTableViewController.h"

@interface AddTableViewController ()

@end

@implementation AddTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *toolBar1 = [[UIBarButtonItem alloc] initWithTitle:@"添加" style:UIBarButtonItemStyleBordered target:self action:@selector(editHandler:)];
    toolBar1.tag = 1;
    UIBarButtonItem *toolBar2 = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(editHandler:)];
    toolBar2.tag = 2;
    [self.toolBar1 setItems:[NSArray arrayWithObjects:toolBar1,toolBar2, nil] animated:YES];
    
    _list = [[NSMutableArray alloc] initWithObjects:@"唐玄奘",@"孙行者",@"猪悟能",@"沙僧",@"白龙马", nil];
    _action = 0;
    self.table1.delegate = self;
    self.table1.dataSource = self;
    self.navigationItem.title=@"编辑表格";
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
    return _list.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    NSInteger rowNO = indexPath.row;
    cell.textLabel.text = [_list objectAtIndex:rowNO];
    return cell;
}

//协议中定义的方法，返回表格的编辑状态
-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _action == 0 ? UITableViewCellEditingStyleDelete : UITableViewCellEditingStyleInsert;
}

//删除状态时确认按钮的文本
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

//设置可编辑的行
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    //设置第二行不可编辑
    return indexPath.row != 1;
}

//移动完成时激发该方法
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //原数据的行号
    NSInteger sourceRowNo = sourceIndexPath.row;
    //目标数据的行号
    NSInteger desRowNo = destinationIndexPath.row;
    id targetObj = [_list objectAtIndex:sourceRowNo];
    [_list removeObjectAtIndex:sourceRowNo];
    [_list insertObject:targetObj atIndex:desRowNo];
    
}

//增删改完成时执行
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowno = indexPath.row;
    //如果是删除操作
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_list removeObjectAtIndex:rowno];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    //如果是新增操作
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        [_list insertObject:[_list objectAtIndex:rowno] atIndex:rowno+1];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
//工具栏按钮单击事件
-(void)editHandler:(UIBarButtonItem *) sender
{
    
    NSLog(@"－－－－－－－－－－打印工具栏单击事件－－－－－－－－－－－");
    
    
    if (sender.tag == 1) {
        _action = 1;
        //设置表格的编辑状态
        [self.table1 setEditing:!self.table1.editing animated:YES];
        if (self.table1.editing) {
            NSLog(@"设置为正在添加状态");
            [[self.toolbarItems objectAtIndex:0] setTitle:@"完成"];
            [[self.toolbarItems objectAtIndex:1] setEnabled:NO];
        }else{
            NSLog(@"设置为添加完成状态");
            [[self.toolbarItems objectAtIndex:0] setTitle:@"添加"];
            [[self.toolbarItems objectAtIndex:1] setEnabled:YES];
        }
    }else
    {
        _action = 0;
        //设置表格的编辑状态
        [self.table1 setEditing:!self.table1.editing animated:YES];
        if (self.table1.editing) {
            NSLog(@"设置为正在删除状态");
            [[self.toolbarItems objectAtIndex:1] setTitle:@"完成"];
            [[self.toolbarItems objectAtIndex:0] setEnabled:NO];
        }else{
            NSLog(@"设置为删除完成状态");
            [[self.toolbarItems objectAtIndex:1] setTitle:@"删除"];
            [[self.toolbarItems objectAtIndex:0] setEnabled:YES];
        }
    }
    NSLog(@"＊＊＊＊＊＊＊＊打印工具栏单击事件结束＊＊＊＊＊＊＊＊＊");
    
}
@end
