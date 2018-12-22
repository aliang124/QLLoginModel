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
#import "QLBusinessUtil.h"

@interface QLWanShanViewController ()
@property (nonatomic,strong) UIButton *cameraBtn;
@property (nonatomic,strong) UIImageView *cameraImg;
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
}
@end
