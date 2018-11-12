//
//  Target_LoginModel.m
//
//
//  Created by elji on 2018/2/9.
//  Copyright © 2018年 elji. All rights reserved.
//

#import "Target_LoginModel.h"
#import "QLLoginViewController.h"
#import "WTDefine.h"
#import "WTUtil.h"
@implementation Target_OtherModel
-(void)Action_loginVC:(NSDictionary*)param {
    QLLoginViewController *camera = [[QLLoginViewController alloc] init];
    login.titleText = param[@"title"];
    WTRootNavPush(login);
}
@end
