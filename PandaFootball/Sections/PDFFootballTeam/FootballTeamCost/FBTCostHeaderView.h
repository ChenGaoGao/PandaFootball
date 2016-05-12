//
//  FBTCostHeaderView.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/12.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBTCostHeaderView : UIView

@property (nonatomic, strong) UIButton *timeButton;
@property (nonatomic, strong) UILabel *timeYearLabel;
@property (nonatomic, strong) UILabel *timeMonthLabel;

@property (nonatomic, strong) UILabel *incomeLabel;
@property (nonatomic, strong) UILabel *expendLabel;
@property (nonatomic, strong) UILabel *surplusLabel;

@end
