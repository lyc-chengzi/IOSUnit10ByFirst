//
//  LYCTableViewCell.m
//  Unit10
//
//  Created by ESI on 15/4/13.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "LYCTableViewCell.h"

@implementation LYCTableViewCell

- (void)awakeFromNib {
    // Initialization code
    }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    NSLog(@"版本%@",[UIDevice currentDevice].systemVersion);
    // Configure the view for the selected state
}

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIColor *bgColor = [UIColor colorWithRed:0.7 green:1.0 blue:0.7 alpha:1.0];
        self.contentView.backgroundColor = bgColor;
        //创建显示书名的label
        UILabel *namelabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 70, 20)];
        namelabel.text=@"书名";
        namelabel.textAlignment = NSTextAlignmentRight;
        namelabel.font = [UIFont boldSystemFontOfSize:17];
        namelabel.backgroundColor = [UIColor clearColor];
        
        //将namelabel添加到当前单元格中
        [self.contentView addSubview:namelabel];
        
        //创建一个显示价格的标签
        UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, 70, 20)];
        priceLabel.text=@"价格";
        priceLabel.textAlignment = NSTextAlignmentRight;
        priceLabel.font = [UIFont boldSystemFontOfSize:17];
        priceLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:priceLabel];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 5, 180, 20)];
        self.nameLabel.text=@"书名";
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.nameLabel.font = [UIFont boldSystemFontOfSize:17];
        self.nameLabel.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.nameLabel];
        
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 30, 180, 20)];
        self.priceLabel.text=@"价格";
        self.priceLabel.textAlignment = NSTextAlignmentLeft;
        self.priceLabel.font = [UIFont boldSystemFontOfSize:17];
        self.priceLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.priceLabel];

        
        
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
//    CGContextFillRect(context, rect);
//    //上分割线，
//    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:1.0 green:0.1 blue:0.2 alpha:1.0].CGColor);
//    CGContextStrokeRect(context, CGRectMake(5, -1, rect.size.width - 10, 1));
//    //下分割线
//    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:1.0 green:0.1 blue:0.2 alpha:1.0].CGColor);
//    CGContextStrokeRect(context, CGRectMake(5, rect.size.height, rect.size.width - 10, 1));
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置填充色
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:1.0 green:0.2 blue:0.2 alpha:1].CGColor);
    CGContextStrokeRect(context, CGRectMake(self.nameLabel.frame.origin.x, rect.size.height - 1, rect.size.width, 1));
}

@end
