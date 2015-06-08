//
//  SearchBarViewController.h
//  Unit10
//
//  Created by ESI on 15/4/15.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchBarViewController : UITableViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_books;
    NSArray *_searchResult;
    BOOL _isSearch;
}
@property (strong, nonatomic) IBOutlet UITableView *table1;
@property (weak, nonatomic) IBOutlet UISearchBar *searchbar1;




@end
