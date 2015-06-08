//
//  LYCPageController.h
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYCPageController : UIViewController
{
    NSArray *_contentList;
    NSArray *_coverList;
}

@property (strong,nonatomic) UILabel *label;
@property (strong,nonatomic) UILabel *bookName;
@property (strong,nonatomic) UIImageView *bookImage;
@property NSInteger pageIndex;
-(id) initWithPageNumber:(NSInteger) pageNumber;
@end
