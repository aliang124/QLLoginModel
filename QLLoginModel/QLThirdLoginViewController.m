//
//  QLThirdLoginViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/11/12.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLThirdLoginViewController.h"
#import "QLWanShanViewController.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "QLLoginUtil.h"

@interface QLThirdLoginViewController ()
@property (nonatomic,strong) UIButton *iconBtn;
@property (nonatomic,strong) UITextField *phoneNameTextField;
@property (nonatomic,strong) UITextField *verifyTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@end

@implementation QLThirdLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBar.bgColor = [UIColor whiteColor];
    
    WTCustomBarItem *itLeft = [[WTCustomBarItem alloc] init];
    itLeft.itemStyle = 1;
    itLeft.imgSize = CGSizeMake(22, 22);
    itLeft.itemImage = [UIImage imageNamed:@"closeBtn"];
    itLeft.onClick = ^{
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    };
    self.navBar.leftItemList = [NSArray arrayWithObject:itLeft];
    
    WTCustomBarItem *itRight = [[WTCustomBarItem alloc] init];
    itRight.itemStyle = 0;
    itRight.itemTitle = @"登录";
    itRight.itemTextColor = QL_NavBar_TitleColor_Black;
    itRight.itemTextFont = [UIFont systemFontOfSize:16];
    itRight.onClick = ^{
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.navBar.rightItemList = [NSArray arrayWithObject:itRight];
    
    [self createSubView];
}

- (void)createSubView {
    _iconBtn = [[UIButton alloc] initWithFrame:CGRectMake((WTScreenWidth-80)/2, 74+WT_Height_StatusBar-20, 80, 80)];
    [_iconBtn setBackgroundImage:[UIImage imageNamed:@"default_userIcon"] forState:UIControlStateNormal];
    _iconBtn.layer.cornerRadius = 40;
    _iconBtn.layer.masksToBounds = YES;
    [self.view addSubview:_iconBtn];
    
    //用户名或手机号
    _phoneNameTextField = [QLLoginUtil createTextFieldView:CGRectMake(24, _iconBtn.bottom+32, WTScreenWidth-24-24, 44) superView:self.view placeHolder:@"请输入用户名或手机号"];
    _phoneNameTextField.text = @"13478906890";
    
    UIButton *clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(_phoneNameTextField.right+15-14-22, _phoneNameTextField.top+11, 22, 22)];
    [clearBtn setImage:[UIImage imageNamed:@"clearBtn"] forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearBtn];

    //验证码
    float verifyViewWidth = _phoneNameTextField.width+30-12-100;
    _verifyTextField = [QLLoginUtil createTextFieldView:CGRectMake(24, _phoneNameTextField.bottom+12, verifyViewWidth, 44) superView:self.view placeHolder:@"请输入验证码码"];

    UIButton *verifyBtn = [[UIButton alloc] initWithFrame:CGRectMake(_verifyTextField.right+15+12, _verifyTextField.top, 100, 44)];
    [QLLoginUtil setRoundBtn:verifyBtn titleText:@"获取验证码"];
    verifyBtn.titleLabel.font = WTFontSys(14);
    [verifyBtn setTitleColor:QL_UserName_TitleColor_Black forState:UIControlStateNormal];
    [self.view addSubview:verifyBtn];

    //设置登录密码
    _passwordTextField = [QLLoginUtil createTextFieldView:CGRectMake(24, _verifyTextField.bottom+12, WTScreenWidth-24-24, 44) superView:self.view placeHolder:@"设置登录密码"];
    
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(24, _passwordTextField.bottom+16, WTScreenWidth-24-24, 44)];
    [QLLoginUtil setRoundBtn:loginBtn titleText:@"确定"];
    [loginBtn addTarget:self action:@selector(loginBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
}

- (void)loginBtnPress {
    QLWanShanViewController *wan = [QLWanShanViewController new];
    [self.navigationController pushViewController:wan animated:YES];
}

- (void)clearBtnPress {
    _phoneNameTextField.text = @"";
}
@end
