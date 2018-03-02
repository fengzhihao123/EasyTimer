//
//  ViewController.m
//  FZHWorkKitDemo
//
//  Created by 冯志浩 on 2018/3/1.
//  Copyright © 2018年 冯志浩. All rights reserved.
//

#import "ViewController.h"
#import "UIView+addFillet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViewFilletView];
}

//view切圆角
- (void)setupViewFilletView {
    UIView *exampleView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    [exampleView setupViewFilletWithRectCorner:UIRectCornerTopRight | UIRectCornerTopLeft radius:10];
    exampleView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:exampleView];
}
@end
