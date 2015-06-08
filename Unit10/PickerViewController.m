//
//  PickerViewController.m
//  Unit10
//
//  Created by ESI on 15/4/10.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

@implementation PickerViewController

NSArray *books;
NSArray *authors;
NSDictionary *dicBooks;
NSString *selectAuthorName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nb.title=@"选择框演示";
    UIBarButtonItem *barBtnRight =[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backToView)];
    self.nb.rightBarButtonItem = barBtnRight;
    
    //创建并初始化图书列表
    books = [NSArray arrayWithObjects:@"图书1",@"图书2",@"图书3",@"图书4",@"图书5", nil];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pv2.dataSource = self;
    self.pv2.delegate = self;
    
    //创建并初始化作者列表
    authors = [NSArray arrayWithObjects:@"作者1",@"作者2",@"作者3", nil];
    
    dicBooks = [NSDictionary dictionaryWithObjectsAndKeys:
                [NSArray arrayWithObjects:@"作者1图书1",@"作者1图书2", nil], @"作者1",
                [NSArray arrayWithObjects:@"作者2图书1",@"作者2图书2", nil], @"作者2",
                [NSArray arrayWithObjects:@"作者3图书1",@"作者3图书2", @"作者3图书3",nil], @"作者3",
                nil];
    
    //默认选择第一个作者
    selectAuthorName = [authors objectAtIndex:0];
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

-(void)backToView
{
    [self dismissViewControllerAnimated:YES completion:^{NSLog(@"返回列表页");}];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if ([pickerView isEqual:self.pickerView])
    {
        return 2;
    }
    else if([pickerView isEqual: self.pv2])
    {
        return 1;
    }
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([pickerView isEqual:self.pickerView])
    {
        if (component == 0)
        {
            return authors.count;
        }
        else
        {
            NSArray *curBookList = (NSArray *)[dicBooks objectForKey:selectAuthorName];
            return curBookList.count;
        }
    }
    else if([pickerView isEqual: self.pv2])
    {
        return books.count;
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([pickerView isEqual:self.pickerView])
    {
        if (component == 0)
        {
            return [authors objectAtIndex:row];
        }else
        {
            return [[dicBooks objectForKey:selectAuthorName] objectAtIndex:row];
        }
    }
    else if([pickerView isEqual: self.pv2])
    {
        return [books objectAtIndex:row];
    }
    return @"无";
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if ([pickerView isEqual:self.pickerView])
    {
        if (component == 0)
        {
            selectAuthorName = [authors objectAtIndex:row];
            [self.pickerView reloadAllComponents];
            NSLog(@"您选择的作者是：%@",[authors objectAtIndex:row]);
        }
        else
        {
            NSLog(@"您选择的图书是：%@",[books objectAtIndex:row]);
        }
    }
    else if([pickerView isEqual: self.pv2])
    {
        NSLog(@"您选择的图书是：%@",[books objectAtIndex:row]);
    }
    
}

@end
