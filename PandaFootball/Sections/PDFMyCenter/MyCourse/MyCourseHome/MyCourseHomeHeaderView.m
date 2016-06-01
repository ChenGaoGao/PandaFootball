//
//  MyCourseHomeHeaderView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/2.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyCourseHomeHeaderView.h"
#import "PDFUIFormatMacros.h"



static const CGFloat kTableViewHeaderHeight         = 150.0f;
static const CGFloat kStateLabelWidth               = 55.0f;
static const CGFloat kStateLabelHeight              = 16.0f;
static const CGFloat kEnchashmentButtonWidth        = 70.0f;
static const CGFloat kEnchashmentButtonHeight       = 17.0f;

@interface MyCourseHomeHeaderView ()

@end

@implementation MyCourseHomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backgroundView];
        [self addSubview:self.moneyLabel];
        [self addSubview:self.stateLabel];
        [self addSubview:self.enchashmentButton];
    }
    return self;
}

#pragma mark - LazyLoad
- (UIImageView *)backgroundView {
    if (_backgroundView) {
        return _backgroundView;
    }
    
    _backgroundView = [[UIImageView alloc] init];
    _backgroundView.frame = CGRectMake(0, 0, MAIN_WIDTH, HEIGHT_From_4_7(kTableViewHeaderHeight));
    
    _backgroundView.clipsToBounds = YES;
    _backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    
    return _backgroundView;
}

- (UILabel *)stateLabel {
    if (_stateLabel) {
        return _stateLabel;
    }
    
    _stateLabel = [[UILabel alloc] init];
    _stateLabel.frame = CGRectMake((MAIN_WIDTH - kStateLabelWidth) / 2,
                                   PDFSpaceSmaller,
                                   kStateLabelWidth,
                                   kStateLabelHeight);
    
    _stateLabel.font = PDFFontDetailSmallest;
    _stateLabel.text = @"已盈利";
    _stateLabel.textColor = PDFColorTextDetailLight;
    _stateLabel.textAlignment = NSTextAlignmentCenter;
    
    _stateLabel.backgroundColor = PDFColorBlank;
    _stateLabel.alpha = 0.1;
    
    _stateLabel.clipsToBounds = YES;
    
    _stateLabel.layer.borderWidth = 0.5;
    _stateLabel.layer.borderColor = PDFColorLineBorder.CGColor;
    _stateLabel.layer.cornerRadius = kStateLabelHeight / 2;
    
    return _stateLabel;
}

- (UILabel *)moneyLabel {
    if (_moneyLabel) {
        return _moneyLabel;
    }
    
    _moneyLabel = [[UILabel alloc] init];
    _moneyLabel.frame = CGRectMake(PDFSpaceDefault, 0, MAIN_WIDTH - PDFSpaceDefault * 2, HEIGHT_From_4_7(kTableViewHeaderHeight));
    
    _moneyLabel.font = [UIFont systemFontOfSize:27.0f];
    _moneyLabel.textColor = PDFColorWhite;
    _moneyLabel.textAlignment = NSTextAlignmentCenter;
    
    return _moneyLabel;
}

- (UIButton *)enchashmentButton {
    if (_enchashmentButton) {
        return _enchashmentButton;
    }
    
    _enchashmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _enchashmentButton.frame = CGRectMake((MAIN_WIDTH - kEnchashmentButtonWidth) / 2,
                                          HEIGHT_From_4_7(kTableViewHeaderHeight) - kEnchashmentButtonHeight - PDFSpaceDefault,
                                          kEnchashmentButtonWidth,
                                          kEnchashmentButtonHeight);
    
    [_enchashmentButton setTitle:@"点击取现" forState:UIControlStateNormal];
    [_enchashmentButton setTitleColor:PDFColorTextDetailLight forState:UIControlStateNormal];
    
    [_enchashmentButton.titleLabel setFont:PDFFontDetailSmaller];
    
    return _enchashmentButton;
}
@end
