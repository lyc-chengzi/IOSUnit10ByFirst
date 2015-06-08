//
//  Collection1ViewController.h
//  Unit10
//
//  Created by ESI on 15/4/15.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Collection1ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSArray *_books;
    NSArray *_covers;
}
@property (weak, nonatomic) IBOutlet UICollectionView *gridView;

@end
