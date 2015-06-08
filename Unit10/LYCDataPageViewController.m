//
//  LYCDataPageViewController.m
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "LYCDataPageViewController.h"

@interface LYCDataPageViewController ()

@end

@implementation LYCDataPageViewController
@synthesize currentPageIndex = _currentPageIndex;

-(instancetype) initWithPageNumber:(NSInteger) pageIndex
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        self.lblAnimalName = [[UILabel alloc] initWithFrame:CGRectMake(screenBounds.origin.x + 20, 80, screenBounds.size.width - 40, 20)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lblAnimalName.text = self.animalName;
    self.imgAnimalImage.image = self.animalImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
-(void)setPageIndex:(NSInteger)index
{
    _currentPageIndex = index;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
