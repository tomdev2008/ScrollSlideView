//
//  ScrollTabBarView.m
//  MobileStore
//
//  Created by sai on 13-1-10.
//  Copyright (c) 2013年 yunpos. All rights reserved.
//

#import "ScrollTabBarView.h"
#import "SlidingTabsControl.h"

@interface ScrollTabBarView ()<SlidingTabsControlDelegate,UIScrollViewDelegate>
{
    UIPageControl *pageControl;
}

@property (nonatomic, strong) NSArray *scrollArray;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) SlidingTabsControl *slideTabs;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ScrollTabBarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (id)initWithViewControllers:(NSArray *)viewControllerArray andTitles:(NSArray *)titleArray{
    if ((self = [super init]))
    {
        self.scrollArray = viewControllerArray;
        self.titleArray = titleArray;
        self.slideTabs = [[SlidingTabsControl alloc]initWithTabCount: self.titleArray.count delegate:self];
        [self initScrollView];
        self.frame = CGRectMake(0, 0, 320, 480);
        self.backgroundColor = [UIColor blueColor];
    }
    return  self;
}

#pragma mark - private method

- (NSArray *) scrollArray
{
    if (!_scrollArray) {
        _scrollArray = [[NSMutableArray alloc]init];
    }
    return _scrollArray;
}

- (NSArray *) titleArray
{
    if (!_titleArray) {
        _titleArray = [[NSArray alloc]init];
    }
    return _titleArray;
}

- (void)initScrollView {
    CGRect bounds = CGRectMake(0, 40, 320, 440);
    self.scrollView = [[UIScrollView alloc] initWithFrame:bounds];
    [self.scrollView setContentSize:CGSizeMake(bounds.size.width * self.scrollArray.count, bounds.size.height)];
    self.scrollView.backgroundColor = [UIColor yellowColor];
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
    [self.scrollView setDelegate:self];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.directionalLockEnabled=YES;
    
    for (int i = 0; i < self.scrollArray.count; i++ ) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        UIViewController *viewController = self.scrollArray[i];
        [viewController.view setFrame:frame];
        
        [self.scrollView addSubview:viewController.view];
        [self addSubview:self.slideTabs];
        [self addSubview:self.scrollView];
        
    }
    
}


# pragma mark - ScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view
{
    return YES;
}
- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    return NO;
}

#pragma mark - slidingtab delegate
- (UILabel *)labelFor:(SlidingTabsControl *)slidingTabsControl atIndex:(NSUInteger)tabIndex
{
    UILabel *label = [[UILabel alloc]init];
    label.text = self.titleArray[tabIndex];
    return label;
}

- (void)touchUpInsideTabIndex:(NSUInteger)tabIndex
{
    [self.scrollView setContentOffset:CGPointMake(320 * tabIndex, 0)];
}

- (void) touchDownAtTabIndex:(NSUInteger)tabIndex
{
    
}

//- (void)drawRect:(CGRect)rect
//{
//    [self addSubview:self.slideTabs];
//    [self addSubview:self.scrollView];
//}

@end
