//
//  QLRegisterViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/11/12.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLRegisterViewController.h"
#import "QLWanShanViewController.h"
#import "WTBaseCore.h"

@interface QLRegisterViewController ()

@end

@implementation QLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WT(bself);
    UIButton *regBtn = [[UIButton alloc] initWithFrame:CGRectMake(WTScreenWidth-60, WT_NavBar_Height-64, 60, 64)];
    [regBtn setTitle:@"登录" forState:UIControlStateNormal];
    [regBtn setBackgroundColor:[UIColor redColor]];
    [regBtn wt_addEventHandler:^{
        [bself.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:regBtn];
    
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake((WTScreenWidth-120)/2, 300, 120, 50)];
    [loginBtn setTitle:@"立即注册" forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:[UIColor redColor]];
    [loginBtn wt_addEventHandler:^{
        [bself registerVC];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

- (void)registerVC {
    QLWanShanViewController *wan = [QLWanShanViewController new];
    [self.navigationController pushViewController:wan animated:YES];
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
