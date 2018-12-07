//
//  QLLoginViewController.m
//  Project
//
//  Created by 计恩良 on 2018/5/27.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLLoginViewController.h"
#import "QLRegisterViewController.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
@interface QLLoginViewController ()

@end

@implementation QLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WT(bself);
    UIButton *regBtn = [[UIButton alloc] initWithFrame:CGRectMake(WTScreenWidth-60, WT_NavBar_Height-64, 60, 64)];
    [regBtn setTitle:@"注册" forState:UIControlStateNormal];
    [regBtn setBackgroundColor:[UIColor redColor]];
    [regBtn wt_addEventHandler:^{
        [bself.navigationController pushViewController:[QLRegisterViewController new] animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:regBtn];
}
- (void)backBtnPress {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
