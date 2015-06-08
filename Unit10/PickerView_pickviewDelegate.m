//
//  PickerView_pickviewDelegate.m
//  Unit10
//
//  Created by ESI on 15/4/10.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "PickerViewController.h"

@implementation PickerViewController_pv2Delegate


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return 1;
    }
    else{
        return 2;
    }
}
@end
