//
//  EasyTableViewController.h
//  Unit10
//
//  Created by ESI on 15/4/13.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYCTableViewCell.h"

@interface EasyTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table1;
@property (weak, nonatomic) IBOutlet UITextField *bookName;
@property (weak, nonatomic) IBOutlet UITextField *bookDetail;
@property (weak, nonatomic) IBOutlet UIButton *btnEdit;


@property (strong,nonatomic) NSMutableArray *books;
@property (strong,nonatomic) NSMutableArray *details;

@property NSInteger editingRowIndex;
- (IBAction)btnEdit_click:(id)sender;
- (IBAction)hideKeyBoard:(id)sender;
@end
