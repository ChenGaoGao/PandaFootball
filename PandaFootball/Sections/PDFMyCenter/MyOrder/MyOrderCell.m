//
//  MyOrderCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/18.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyOrderCell.h"
#import "PDFUIFormatMacros.h"

@interface MyOrderCell ()

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UILabel *perCostLabel;
@property (nonatomic, assign) CGFloat horizontalMargin;

@end

@implementation MyOrderCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.titleTimeLabel];
        
        [self addSubview:self.bgImageView];
        [self.bgImageView addSubview:self.orderIdLabel];
        [self.bgImageView addSubview:self.siteNameLabel];
        [self.bgImageView addSubview:self.siteTypeLabel];
        [self.bgImageView addSubview:self.costLabel];
        [self.bgImageView addSubview:self.orderTimeLabel];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - LazyLoad
- (CGFloat)horizontalMargin {
    if (IS_3_5Inches || IS_4_0Inches) {
        return 10.0f;
    }
    if (IS_4_7Inches) {
        return 12.5f;
    }
    if (IS_5_5Inches) {
        return 17.0f;
    }
    return 10.0f;
}

- (UILabel *)titleTimeLabel {
    if (_orderTimeLabel) {
        return _orderTimeLabel;
    }
    _orderTimeLabel = [[UILabel alloc] init];
    _orderTimeLabel.frame = CGRectMake(self.horizontalMargin,
                                       0,
                                       MAIN_WIDTH - self.horizontalMargin * 2,
                                       PDFLabelHeightDetailSmallest + PDFSpaceSmaller * 2);
    
    _orderTimeLabel.font = PDFFontDetailSmallest;
    _orderTimeLabel.textColor = PDFColorTextDetailDefault;
    _orderTimeLabel.textAlignment = NSTextAlignmentCenter;
    
    return _orderTimeLabel;
}

- (UIImageView *)bgImageView {
    if (_bgImageView) {
        return _bgImageView;
    }
    _bgImageView = [[UIImageView alloc] init];
    _bgImageView.frame = CGRectMake(self.horizontalMargin,
                                    VIEW_BOTTOM(_orderTimeLabel),
                                    MAIN_WIDTH - self.horizontalMargin * 2,
                                    PDFLabelHeightDetailSmallest + PDFSpaceSmaller * 2);
    
    return _bgImageView;
}

@end
