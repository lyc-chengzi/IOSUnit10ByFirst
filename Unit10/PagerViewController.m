//
//  PagerViewController.m
//  Unit10
//
//  Created by ESI on 15/4/16.
//  Copyright (c) 2015年 ESI. All rights reserved.
//

#import "PagerViewController.h"

@interface PagerViewController ()

@end

@implementation PagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    _contentList = [NSArray arrayWithObjects:@"java",@".net",@"ios",@"C", nil];
    _coverList = [NSArray arrayWithObjects:@"mouse.png",@"duck.png",@"dog.png",@"rabbit.png", nil];
    
    NSInteger pageCount = _contentList.count;
    
    //采用延迟加载的方式加载LYCPageController
    //使用nil占位，等程序需要时再加在LYVPageController
    _viewControllers = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < pageCount; i++) {
        [_viewControllers addObject:[NSNull null]];
    }
    
    //****************创建UIScrollScroll对象
    
    CGRect _svFrame = [[UIScreen mainScreen] bounds];
    _svFrame.origin.y = 64;
    _scrollView.frame = _svFrame;
    _scrollView = [[UIScrollView alloc] initWithFrame:_svFrame];
    
    
    //设置背景色
    _scrollView.backgroundColor = [UIColor grayColor];
    _scrollView.pagingEnabled = YES;
    //设置contentSize，就是可滚动区域的大小(当前宽度 ＊ 页数)
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width * pageCount, _scrollView.frame.size.height);
    _scrollView.showsHorizontalScrollIndicator=NO;//横向滚动
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollsToTop = NO;
    
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    
    
    //****************创建pageControl
    _pagecontrol = [[UIPageControl alloc] init];
    _pagecontrol.frame = CGRectMake(0, _scrollView.frame.size.height - 80, _scrollView.frame.size.width, 80);
    //分页控件的圆点颜色
    _pagecontrol.pageIndicatorTintColor = [UIColor whiteColor];
    _pagecontrol.currentPageIndicatorTintColor = [UIColor redColor];
    
    _pagecontrol.currentPage = 0;
    _pagecontrol.numberOfPages = pageCount;
    _pagecontrol.hidesForSinglePage = YES;
    [_pagecontrol addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pagecontrol];
    //默认加载第一页
    [self loadScrollViewWithPage:0];
    
    //避免不好的效果，同时加载第二页
    [self loadScrollViewWithPage:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) loadScrollViewWithPage:(NSInteger) page
{
    if (page >= _contentList.count) {
        return;
    }
    //查找相关页面的page
    LYCPageController *controller = [_viewControllers objectAtIndex:page];
    //如果要加载的对象还未初始化
    if ((NSNull *)controller == [NSNull null]) {
        NSLog(@"1创建单页对象");
        //创建LYCPageController对象
        controller = [[LYCPageController alloc] initWithPageNumber:page];
        //并替换数组中对应的对象
        [_viewControllers replaceObjectAtIndex:page withObject:controller];
    }
    //将controller对应的view添加到UIScrollView中
    if (controller.view.superview == nil) {
        NSLog(@"2单页对象添加到uiscrollView");
        //计算这个view在UIScrollView中的位置
        CGRect _frame = _scrollView.frame;
        _frame.origin.x = _frame.size.width * page;
        _frame.origin.y = 0;
        
        //将计算好的位置和大小赋给view
        controller.view.frame = _frame;
        controller.bookName.text = [_contentList objectAtIndex:page];
        controller.bookImage.image = [UIImage imageNamed:[_coverList objectAtIndex:page]];
        
        //将controller添加为当前控制器的子控制器
        [self addChildViewController:controller];
        //将controller对应的view添加到uiscrollview中
        [_scrollView addSubview:controller.view];
    }
}

//当用户滚动UIScrollView后激发
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取UIScrollView的宽度，就是页面的宽度
    CGFloat pageWidth = scrollView.frame.size.width;
    //用UIScrollView水平滚动的距离减去页面宽度的一半，除以页面宽度的结果再加1，
    //可获得当前处于第几页
    NSInteger currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    _pagecontrol.currentPage = currentPage;
    
    //为了避免闪烁，同时加载上一页、本页、下一页的结果
    [self loadScrollViewWithPage:currentPage - 1];
    [self loadScrollViewWithPage:currentPage];
    [self loadScrollViewWithPage:currentPage + 1];
    
}
//用户更改UIPageControl的选中页时激发该方法
-(void) changePage:(id) sender
{
    NSInteger currentPage = [sender currentPage];
    //创建一个CGRect对象，该区域代表该UIScrollView将要显示的页
    CGRect bounds = _scrollView.bounds;
    bounds.origin.x = bounds.size.width * currentPage;
    bounds.origin.y = 0;
    //控制UIScrollView滚动到指定区域
    [_scrollView scrollRectToVisible:bounds animated:YES];
    
    //为了避免闪烁，同时加载上一页、本页、下一页的结果
    [self loadScrollViewWithPage:currentPage - 1];
    [self loadScrollViewWithPage:currentPage];
    [self loadScrollViewWithPage:currentPage + 1];
}

@end
