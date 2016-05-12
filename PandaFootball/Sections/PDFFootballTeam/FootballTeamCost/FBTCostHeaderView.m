//
//  FBTCostHeaderView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/12.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FBTCostHeaderView.h"
#import "PDFUIFormatMacros.h"




static const CGFloat kTimeButtonWidth           = 40.0f;
static const CGFloat kTimeButtonHeight          = 50.0f;

@interface FBTCostHeaderView ()

@property (nonatomic, strong) UIView *timeTopLineView;
@property (nonatomic, strong) UIView *timeBottomLineView;

@property (nonatomic, strong) UILabel *perIncomeLabel;
@property (nonatomic, strong) UILabel *perExpendLabel;
@property (nonatomic, strong) UILabel *perSurplusLabel;

@end

@implementation FBTCostHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = PDFColorRed;
        
        [self addSubview:self.timeButton];
        [self.timeButton addSubview:self.timeYearLabel];
        [self.timeButton addSubview:self.timeMonthLabel];
        [self.timeButton addSubview:self.timeTopLineView];
        [self.timeButton addSubview:self.timeBottomLineView];
        
        [self addSubview:self.perIncomeLabel];
        [self addSubview:self.incomeLabel];
        [self addSubview:self.perExpendLabel];
        [self addSubview:self.expendLabel];
        [self addSubview:self.perSurplusLabel];
        [self addSubview:self.surplusLabel];
    }
    return self;
}

#pragma mark - LazyLoad
- (UIButton *)timeButton {
    if (!_timeButton) {
        _timeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _timeButton.frame = CGRectMake(PDFSpaceBigger, PDFSpaceBigger, kTimeButtonWidth, kTimeButtonHeight);
    }
    return _timeButton;
}

- (UILabel *)timeYearLabel {
    if (!_timeYearLabel) {
        _timeYearLabel = [[UILabel alloc] init];
        _timeYearLabel.frame = CGRectMake(0, 0, kTimeButtonWidth, PDFLabelHeightDetailSmallest + PDFSpaceSmallest * 2);
    }
    return _timeYearLabel;
}

@end
