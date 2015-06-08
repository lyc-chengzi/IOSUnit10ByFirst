//
//  SearchDisplayViewController.m
//  Unit10
//
//  Created by ESI on 15/4/15.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "SearchDisplayViewController.h"

@interface SearchDisplayViewController ()

@end

@implementation SearchDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _isSearch = NO;
    _books = [NSArray arrayWithObjects:
              @"C#高级编程",
              @"C#入门",
              @"C#.net MVC编程",
              @"java入门",
              @"java高级编程",
              @"java网络编程",
              @"php网页编程",
              @"IOS入门－oc学习",
              @"IOS页面设计",
              @"IOS高级编程",
              @"android初级",
              @"android高级",
              nil];

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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_isSearch == YES) {
        return _searchResult.count;
    }else{
        return _books.count;
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowNO = indexPath.row;
    static NSString *cID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cID];
    }
    if (_isSearch) {
        cell.textLabel.text = [_searchResult objectAtIndex:rowNO];
    }else
    {
        cell.textLabel.text = [_books objectAtIndex:rowNO];
    }
    return cell;
}

-(void) filterBySubstring:(NSString *) str
{
    _isSearch = YES;
    //定义搜索谓词
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@",str];
    //使用谓词过滤_books
    _searchResult = [_books filteredArrayUsingPredicate:pred];
}

//点击取消按钮时激发
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    _isSearch = NO;
}

//搜索内容改变时激发
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self filterBySubstring:searchText];
}

//点击键盘上的搜索按钮时触发
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self filterBySubstring:searchBar.text];
    [searchBar resignFirstResponder];
}

@end
