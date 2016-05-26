//
//  ViewController.m
//  QAlert
//
//  Created by qzp on 16/5/26.
//  Copyright © 2016年 qzp. All rights reserved.
//

#import "ViewController.h"
#import "QZPAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    QZPAlertView * alert = [[QZPAlertView alloc] init];
    alert.type = QZPAlertViewTypeInput;
    alert.message = @"Hello World!";
    alert.tColor = [UIColor colorWithRed:0.230 green:0.777 blue:0.316 alpha:1.000];
    [alert showInView: self.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
