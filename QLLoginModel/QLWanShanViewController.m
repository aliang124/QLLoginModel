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
    [self initForm];
//    [self createSubView];
}

- (void)initForm {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];

    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
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
    //孩子信息
    UILabel *haiInfo = [[UILabel alloc] initWithFrame:CGRectMake(24, _checkShenFenBtn.bottom+12, WTScreenWidth-24-23, 12)];
    haiInfo.font = WTFontSys(12);
    haiInfo.textColor = QL_DescColor_Gray;
    haiInfo.text = @"孩子信息";
    [self.view addSubview:haiInfo];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(24, haiInfo.bottom+12, WTScreenWidth-24-23, 184)];
    bgView.layer.cornerRadius = 2;
    bgView.layer.masksToBounds = YES;
    bgView.layer.borderColor = WTColorHex(0xECECE6).CGColor;
    bgView.layer.borderWidth = 1;
    [self.view addSubview:bgView];
    
    UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 48, bgView.width-12-12, 1)];
    line1.backgroundColor = WTColorHex(0xEEEEE5);
    [bgView addSubview:line1];

    UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 96, bgView.width-12-12, 1)];
    line2.backgroundColor = WTColorHex(0xEEEEE5);
    [bgView addSubview:line2];

    UIImageView *line3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 144, bgView.width, 1)];
    line3.backgroundColor = WTColorHex(0xEEEEE5);
    [bgView addSubview:line3];
    //清除信息
    UIButton *clearInfo = [[UIButton alloc] initWithFrame:CGRectMake(0, 145, bgView.width, 39)];
    [clearInfo setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    clearInfo.titleLabel.font = WTFontSys(12);
    [clearInfo setTitleColor:WTColorHex(0xFF6A18) forState:UIControlStateNormal];
    [clearInfo setTitle:@"清除信息" forState:UIControlStateNormal];
    [bgView addSubview:clearInfo];
}
@end
