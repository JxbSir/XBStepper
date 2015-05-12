//
//  ViewController.m
//  XBStepper
//
//  Created by Peter Jin mail:i@Jxb.name on 15/5/12.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import "ViewController.h"
#import "XBStepper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XBStepper* stepper = [[XBStepper alloc] initWithFrame:CGRectMake(60, 100, 200, 40)];
    [stepper setMaxValue:10 min:-10 now:1];
    [self.view addSubview:stepper];
}

@end
