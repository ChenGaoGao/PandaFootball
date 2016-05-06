//
//  SROConfirmView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/6.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "SROConfirmView.h"
#import "PDFUIFormatMacros.h"


static const CGFloat kConfirmViewHeight     = 50.0f;
static const CGFloat kPerLabelWidth         = 60.0f;
static const CGFloat kConfirmButtonWidth    = 100.0f;


@interface SROConfirmView ()

@property (nonatomic, strong) UILabel *perCostLabel;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation SROConfirmView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.perCostLabel];
        [self addSubview:self.costLabel];
        [self addSubview:self.confirmButton];
        
        [self addSubview:self.lineView];
    }
    return self;
}

#pragma mark - LazyLoad
- (UILabel *)perCostLabel {
    if (!_perCostLabel) {
        _perCostLabel = [[UILabel alloc] init];
        _perCostLabel.frame = CGRectMake(PDFSpaceDefault, 0, kPerLabelWidth, kConfirmViewHeight);
        
        _perCostLabel.font = PDFFontDetailDefault;
        _perCostLabel.text = @"需支付:";
        _perCostLabel.textColor = PDFColorTextBodyLight;
    }
    return _perCostLabel;
}

- (UILabel *)costLabel {
    if (!_costLabel) {
        _costLabel = [[UILabel alloc] init];
        _costLabel.frame = CGRectMake(VIEW_RIGHT(_perCostLabel), 0,
                                      MAIN_WIDTH - kPerLabelWidth - kConfirmButtonWidth - PDFSpaceDefault * 2,
                                      kConfirmViewHeight);
        
        _costLabel.font = PDFFontBodySmaller;
        _costLabel.textColor = PDFColorOrange;
    }
    return _costLabel;
}

- (UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.frame = CGRectMake(MAIN_WIDTH - kConfirmButtonWidth, 0,
                                          kConfirmButtonWidth, kConfirmViewHeight);
        
        [_confirmButton setBackgroundColor:PDFColorOrange];
        [_confirmButton setTitle:@"确认" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:PDFColorWhite forState:UIControlStateNormal];
    }
    return _confirmButton;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.frame = CGRectMake(0, 0, MAIN_WIDTH, 0.5);
        
        _lineView.backgroundColor = PDFColorLineSplit;
    }
    return _lineView;
}

@end
