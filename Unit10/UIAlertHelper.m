//
//  UIAlertHelper.m
//  Unit10
//
//  Created by ESI on 15/4/8.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "UIAlertHelper.h"

@implementation UIAlertHelper
+(UIAlertView *) getAlertViewInstance:(NSString *) title message:(NSString *) message delegate:(id) delegate cancelButtonTitle:(NSString *) cbt otherbuttonTitles:(NSString *) obt,...
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:cbt otherButtonTitles:obt, nil];
    return alertView;
}

@end
