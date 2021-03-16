//
//  ViewController.m
//  LunchImageTest
//
//  Created by ckl@pmm on 2017/12/28.
//  Copyright © 2017年 pronetway. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:235/255.0f green:235/255.0f blue:235/255.0f alpha:1.0];//[UIColor colorWithRed:238.0/255.0f green:173.0/255.0f blue:14.0/255.0f alpha:1.0];
    
    self.title = @"首页";
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    lab.font = [UIFont boldSystemFontOfSize:22];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = @"欢迎来到首页";
//    [self.view addSubview:lab];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
