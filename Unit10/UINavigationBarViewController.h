//
//  UINavigationBarViewController.h
//  Unit10
//
//  Created by ESI on 15/4/7.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBarViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UINavigationItem *NbItem;
@property (weak, nonatomic) IBOutlet UIWebView *WebView1;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *aiv1;

@end
