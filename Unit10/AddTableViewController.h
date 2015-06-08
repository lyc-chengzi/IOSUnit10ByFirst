//
//  AddTableViewController.h
//  Unit10
//
//  Created by ESI on 15/4/14.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_list;
    NSUInteger _action;//0是删除，1是添加
}

@property (weak, nonatomic) IBOutlet UITableView *table1;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar1;

@end
