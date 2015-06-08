//
//  SearchDisplayViewController.h
//  Unit10
//
//  Created by ESI on 15/4/15.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDisplayViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
{
    NSArray *_books;
    NSArray *_searchResult;
    BOOL _isSearch;
}
@end
