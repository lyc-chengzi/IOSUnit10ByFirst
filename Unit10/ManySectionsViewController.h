//
//  ManySectionsViewController.h
//  Unit10
//
//  Created by ESI on 15/4/14.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManySectionsViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableDictionary *_tableData;
    NSArray *_stories;
}
@property (weak, nonatomic) IBOutlet UITableView *table1;
@property UIRefreshControl *refreshCtrl;
@end
