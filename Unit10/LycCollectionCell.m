//
//  LycCollectionCellCollectionViewCell.m
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "LycCollectionCell.h"

@implementation LycCollectionCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建一个UIImageView
        UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"123.png"]];
        imageview.frame = CGRectMake(0, 0, 154, 200);
        //将imageview添加到该单元格中
        [self.contentView addSubview:imageview];
        
        //创建一个uilable控件
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        self.textLabel.backgroundColor = [UIColor clearColor];
        //设置该控件的自动缩放属性
        self.textLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.font = [UIFont boldSystemFontOfSize:50];
        self.textLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:self.textLabel];
        
        //设置边框
        self.contentView.layer.borderWidth = 2.0f;
        self.contentView.layer.borderColor = [UIColor redColor].CGColor;
        //设置圆角
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
    }
    return self;
}
@end
