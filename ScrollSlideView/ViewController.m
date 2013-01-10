//
//  ViewController.m
//  ScrollSlideView
//
//  Created by sai on 13-1-10.
//  Copyright (c) 2013年 xmsai. All rights reserved.
//

#import "ViewController.h"
#import "ScrollTabBarView.h"

@interface ViewController ()

@property (strong, nonatomic)ScrollTabBarView *scrollTabBarView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIViewController *viewController1 = [[UIViewController alloc]init];
    viewController1.view.backgroundColor = [UIColor redColor];
    UIViewController *viewController2 = [[UIViewController alloc]init];
    viewController2.view.backgroundColor = [UIColor yellowColor];
    UIViewController *viewController3 = [[UIViewController alloc]init];
    viewController3.view.backgroundColor = [UIColor blackColor];
    
    NSArray *controllerArray = @[viewController1,viewController2,viewController3];
    NSArray *titleArray = @[@"v1",@"v2",@"v3"];
    
    
    self.scrollTabBarView = [[ScrollTabBarView alloc]initWithViewControllers:controllerArray andTitles:titleArray];
    //    self.scrollTabBarView = [[ScrollTabBarView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollTabBarView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
