//
//  LYCDataPageViewController.h
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYCDataPageViewController : UIViewController
@property (readonly,nonatomic) NSInteger currentPageIndex;
@property (strong, nonatomic) IBOutlet UILabel *lblAnimalName;
@property (strong, nonatomic) IBOutlet UIImageView *imgAnimalImage;
@property (strong,nonatomic) NSString *animalName;
@property (strong,nonatomic) UIImage *animalImage;
-(void)setPageIndex:(NSInteger) index;
@end
