//
//  Collection2ViewController.h
//  Unit10
//
//  Created by ESI on 15/4/15.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LycCollectionLayout.h"

@interface Collection2ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSInteger _cellCount;
}
@property (weak, nonatomic) IBOutlet UICollectionView *grieview;

@end
