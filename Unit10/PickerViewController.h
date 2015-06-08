//
//  PickerViewController.h
//  Unit10
//
//  Created by ESI on 15/4/10.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>
//pickerView演示页面控制器
@interface PickerViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UINavigationItem *nb;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *pv2;
@end

//pickView中pv2控件的实现类
@interface PickerViewController_pv2Delegate : NSObject<UIPickerViewDelegate,UIPickerViewDataSource>

@end