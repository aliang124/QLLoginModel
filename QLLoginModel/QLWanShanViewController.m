//
//  QLWanShanViewController.m
//  WTDemo
//
//  Created by 计恩良 on 2018/11/12.
//  Copyright © 2018年 计恩良. All rights reserved.
//

#import "QLWanShanViewController.h"
#import "WTBaseCore.h"
#import "QLBusiness.h"
#import "QLLoginUtil.h"
#import "QLSelectCheckButton.h"

@interface QLWanShanViewController ()
@property (nonatomic,strong) UIButton *cameraBtn;
@property (nonatomic,strong) UIImageView *cameraImg;
@property (nonatomic,strong) UITextField *nickNameTextField;
@property (nonatomic,strong) QLSelectCheckButton *checkAreaBtn;
@property (nonatomic,strong) QLSelectCheckButton *checkShenFenBtn;
@end

@implementation QLWanShanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navBar.bgColor = [UIColor whiteColor];
    
    WTCustomBarItem *itRight = [[WTCustomBarItem alloc] init];
    itRight.itemStyle = 0;
    itRight.itemTitle = @"跳过";
    itRight.itemTextColor = QL_NavBar_TitleColor_Black;
    itRight.itemTextFont = [UIFont systemFontOfSize:16];
    itRight.onClick = ^{
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.navBar.rightItemList = [NSArray arrayWithObject:itRight];
    [self createSubView];
}

- (void)createSubView {
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(25, 88+WT_Height_StatusBar-20, WTScreenWidth-25-25, 23)];
    titleLab.font = WTFontSys(24);
    titleLab.textColor = QL_NavBar_TitleColor_Black;
    titleLab.text = @"完善资料";
    [self.view addSubview:titleLab];

    UILabel *subTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(25, titleLab.bottom+14, titleLab.width, 11)];
    subTitleLab.font = WTFontSys(12);
    subTitleLab.textColor = QL_DescColor_Gray;
    subTitleLab.text = @"请完善你的基本信息";
    [self.view addSubview:subTitleLab];
    
    _cameraBtn = [[UIButton alloc] initWithFrame:CGRectMake(WTScreenWidth-23-56, 84+WT_Height_StatusBar-20, 56, 56)];
    [_cameraBtn setBackgroundImage:[WTUtil createImageFromColor:QL_NavBar_BgColor_Yellow] forState:UIControlStateNormal];
    _cameraBtn.layer.cornerRadius = 28;
    _cameraBtn.layer.masksToBounds = YES;
    [self.view addSubview:_cameraBtn];
    
    _cameraImg = [[UIImageView alloc] initWithFrame:CGRectMake(14, 14, 28, 28)];
    [_cameraImg setImage:[UIImage imageNamed:@"camera"]];
    [_cameraBtn addSubview:_cameraImg];
    //昵称
    _nickNameTextField = [QLLoginUtil createTextFieldView:CGRectMake(24, subTitleLab.bottom+32, WTScreenWidth-24-23, 44) superView:self.view placeHolder:@"你的昵称"];
    //所在地
    _checkAreaBtn = [[QLSelectCheckButton alloc] initWithFrame:CGRectMake(24, _nickNameTextField.bottom+12, WTScreenWidth-24-23, 44)];
    _checkAreaBtn.leftText = @"所在地";
    _checkAreaBtn.rightText = @"请选择";
    [self.view addSubview:_checkAreaBtn];
    //当前身份
    _checkShenFenBtn = [[QLSelectCheckButton alloc] initWithFrame:CGRectMake(24, _checkAreaBtn.bottom+12, WTScreenWidth-24-23, 44)];
    _checkShenFenBtn.leftText = @"当前身份";
    _checkShenFenBtn.rightText = @"宝爸";
    [self.view addSubview:_checkShenFenBtn];
    //
}
@end
