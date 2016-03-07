//
//  ViewController.m
//  CircleProcessView
//
//  Created by 超冷 on 15/12/2.
//  Copyright © 2015年 Chono. All rights reserved.
//

#import "ViewController.h"

#import "CircleProcessView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CircleProcessView *circle = [[CircleProcessView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:circle];
    
    [circle drawProgressWithProgerss:0.6];
}

@end
