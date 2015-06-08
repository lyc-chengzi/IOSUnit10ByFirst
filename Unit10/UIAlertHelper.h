//
//  UIAlertHelper.h
//  Unit10
//
//  Created by ESI on 15/4/8.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIAlertHelper : NSObject

+(UIAlertView *) getAlertViewInstance:(NSString *) title message:(NSString *) message delegate:(id) delegate cancelButtonTitle:(NSString *) cbt otherbuttonTitles:(NSString *) obt,...;


@end
