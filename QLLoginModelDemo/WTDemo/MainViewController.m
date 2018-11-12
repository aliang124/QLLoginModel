//
//  MainViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/11/12.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "MainViewController.h"
#import "QLLoginViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navBar.leftItemList = [NSArray array];
    self.navBar.title = @"首页";
    [self performSelector:@selector(goLogin) withObject:nil afterDelay:0.5];
}

- (void)goLogin {
    QLLoginViewController *login = [[QLLoginViewController alloc] init];
    [self.navigationController presentViewController:[[UINavigationController alloc] initWithRootViewController:login] animated:YES completion:nil];
}
@end
