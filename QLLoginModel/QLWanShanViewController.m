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
#import "QLWanShanTitleCell.h"
#import "QLNickNameCell.h"
#import "QLSelectCheckCell.h"

@interface QLWanShanViewController ()
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
    self.formTable.frame = CGRectMake(0, 84+WT_Height_StatusBar-20, WTScreenWidth, WTScreenHeight-(84+WT_Height_StatusBar-20)-55);
    self.formManager[@"QLWanShanTitleItem"] = @"QLWanShanTitleCell";
    self.formManager[@"QLNickNameItem"] = @"QLNickNameCell";
    self.formManager[@"QLSelectCheckItem"] = @"QLSelectCheckCell";
    [self initForm];
}

- (void)initForm {
    WT(bself);
    NSMutableArray *sectionArray = [NSMutableArray array];
    RETableViewSection *section0 = [RETableViewSection section];

    QLWanShanTitleItem *itHead = [[QLWanShanTitleItem alloc] init];
    [section0 addItem:itHead];
    
    [section0 addItem:[WTEmptyItem initWithHeight:28]];
    
    QLNickNameItem *itNickName = [[QLNickNameItem alloc] init];
    [section0 addItem:itNickName];
    
    [section0 addItem:[WTEmptyItem initWithHeight:12]];

    QLSelectCheckItem *itArea = [[QLSelectCheckItem alloc] init];
    itArea.leftText = @"所在地";
    itArea.rightText = @"请选择";
    [section0 addItem:itArea];
    
    [section0 addItem:[WTEmptyItem initWithHeight:12]];

    QLSelectCheckItem *itShenFen = [[QLSelectCheckItem alloc] init];
    itShenFen.leftText = @"当前身份";
    itShenFen.rightText = @"宝爸";
    [section0 addItem:itShenFen];

    [sectionArray addObject:section0];
    [self.formManager replaceSectionsWithSectionsFromArray:sectionArray];
    
    [self.formTable reloadData];
}

- (void)createSubView {
    //孩子信息
//    UILabel *haiInfo = [[UILabel alloc] initWithFrame:CGRectMake(24, _checkShenFenBtn.bottom+12, WTScreenWidth-24-23, 12)];
//    haiInfo.font = WTFontSys(12);
//    haiInfo.textColor = QL_DescColor_Gray;
//    haiInfo.text = @"孩子信息";
//    [self.view addSubview:haiInfo];
//    
//    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(24, haiInfo.bottom+12, WTScreenWidth-24-23, 184)];
//    bgView.layer.cornerRadius = 2;
//    bgView.layer.masksToBounds = YES;
//    bgView.layer.borderColor = WTColorHex(0xECECE6).CGColor;
//    bgView.layer.borderWidth = 1;
//    [self.view addSubview:bgView];
//    
//    UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 48, bgView.width-12-12, 1)];
//    line1.backgroundColor = WTColorHex(0xEEEEE5);
//    [bgView addSubview:line1];
//
//    UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 96, bgView.width-12-12, 1)];
//    line2.backgroundColor = WTColorHex(0xEEEEE5);
//    [bgView addSubview:line2];
//
//    UIImageView *line3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 144, bgView.width, 1)];
//    line3.backgroundColor = WTColorHex(0xEEEEE5);
//    [bgView addSubview:line3];
//    //清除信息
//    UIButton *clearInfo = [[UIButton alloc] initWithFrame:CGRectMake(0, 145, bgView.width, 39)];
//    [clearInfo setBackgroundImage:[WTUtil createImageFromColor:[UIColor whiteColor]] forState:UIControlStateNormal];
//    clearInfo.titleLabel.font = WTFontSys(12);
//    [clearInfo setTitleColor:WTColorHex(0xFF6A18) forState:UIControlStateNormal];
//    [clearInfo setTitle:@"清除信息" forState:UIControlStateNormal];
//    [bgView addSubview:clearInfo];
}
@end
