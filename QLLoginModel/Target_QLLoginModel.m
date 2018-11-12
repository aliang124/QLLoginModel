//
//  Target_QLLoginModel.m
//
//
//  Created by elji on 2018/2/9.
//  Copyright © 2018年 elji. All rights reserved.
//

#import "Target_QLLoginModel.h"
#import "QLLoginViewController.h"
@implementation Target_QLLoginModel
-(void)Action_loginVC:(NSDictionary*)param {
    QLLoginViewController *login = [[QLLoginViewController alloc] init];
    login.titleText = param[@"title"];
    [login.navigationController presentViewController:[[UINavigationController alloc] initWithRootViewController:login] animated:YES completion:nil];
}
@end
