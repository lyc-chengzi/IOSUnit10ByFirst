//
//  CustomTable3ViewController.h
//  Unit10
//
//  Created by ESI on 15/4/13.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYCNibTableCell.h"

@interface CustomTable3ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table1;

@end
