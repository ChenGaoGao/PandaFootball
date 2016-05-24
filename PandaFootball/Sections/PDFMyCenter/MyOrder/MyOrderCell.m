//
//  MyOrderCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/18.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyOrderCell.h"
#import "PDFUIFormatMacros.h"



static const CGFloat kPerLabelWidth     = 65.0f;
static const CGFloat kBGImageViewHeight = 165.0f;

@interface MyOrderCell ()

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *perCostLabel;
@property (nonatomic, assign) CGFloat horizontalMargin;

@end

@implementation MyOrderCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = PDFColorBackground;
        
        [self addSubview:self.titleTimeLabel];
        
        [self addSubview:self.bgImageView];
        [self.bgImageView addSubview:self.orderIdLabel];
        [self.bgImageView addSubview:self.lineView];
        [self.bgImageView addSubview:self.siteNameLabel];
        [self.bgImageView addSubview:self.siteTypeLabel];
        [self.bgImageView addSubview:self.perCostLabel];
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
    if (_titleTimeLabel) {
        return _titleTimeLabel;
    }
    
    _titleTimeLabel = [[UILabel alloc] init];
    _titleTimeLabel.frame = CGRectMake(self.horizontalMargin,
                                       0,
                                       MAIN_WIDTH - self.horizontalMargin * 2,
                                       PDFLabelHeightDetailSmallest + PDFSpaceSmaller * 2);
    
    _titleTimeLabel.font = PDFFontDetailSmallest;
    _titleTimeLabel.textColor = PDFColorTextDetailDefault;
    _titleTimeLabel.textAlignment = NSTextAlignmentCenter;
    
    return _titleTimeLabel;
}

- (UIImageView *)bgImageView {
    if (_bgImageView) {
        return _bgImageView;
    }
    
    _bgImageView = [[UIImageView alloc] init];
    _bgImageView.frame = CGRectMake(self.horizontalMargin,
                                    VIEW_BOTTOM(_titleTimeLabel),
                                    MAIN_WIDTH - self.horizontalMargin * 2,
                                    kBGImageViewHeight);
    
    UIImage *image = [UIImage imageNamed:@"MyOrderBackground"];
    _bgImageView.image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)
                                               resizingMode:UIImageResizingModeTile];
    
    return _bgImageView;
}

- (UILabel *)orderIdLabel {
    if (_orderIdLabel) {
        return _orderIdLabel;
    }
    
    _orderIdLabel = [[UILabel alloc] init];
    _orderIdLabel.frame = CGRectMake(PDFSpaceSmaller,
                                     PDFSpaceDefault,
                                     VIEW_WIDTH(_bgImageView) - PDFSpaceSmaller * 2,
                                     PDFLabelHeightDetailBigger);
    
    _orderIdLabel.font = PDFFontDetailBigger;
    _orderIdLabel.textColor = PDFColorTextDetailDefault;
    
    return _orderIdLabel;
}

- (UIView *)lineView {
    if (_lineView) {
        return _lineView;
    }
    
    _lineView = [[UIView alloc] init];
    _lineView.frame = CGRectMake(0, VIEW_BOTTOM(_orderIdLabel) + PDFSpaceDefault - 0.5, VIEW_WIDTH(_bgImageView), 0.5);
    _lineView.backgroundColor = PDFColorLineSplit;
    return _lineView;
}

- (UILabel *)siteNameLabel {
    if (_siteNameLabel) {
        return _siteNameLabel;
    }
    
    _siteNameLabel = [[UILabel alloc] init];
    _siteNameLabel.frame = CGRectMake(PDFSpaceSmaller,
                                      VIEW_BOTTOM(_lineView) + PDFSpaceDefault,
                                      VIEW_WIDTH(_bgImageView) - PDFSpaceSmaller * 2,
                                      PDFLabelHeightDetailSmaller);
    
    _siteNameLabel.font = PDFFontDetailSmaller;
    _siteNameLabel.textColor = PDFColorTextDetailDefault;
    
    return _siteNameLabel;
}

- (UILabel *)siteTypeLabel {
    if (_siteTypeLabel) {
        return _siteTypeLabel;
    }
    
    _siteTypeLabel = [[UILabel alloc] init];
    _siteTypeLabel.frame = CGRectMake(PDFSpaceSmaller,
                                     VIEW_BOTTOM(_siteNameLabel) + PDFSpaceSmaller,
                                     VIEW_WIDTH(_bgImageView) - PDFSpaceSmaller * 2,
                                     PDFLabelHeightDetailSmaller);
    
    _siteTypeLabel.font = PDFFontDetailSmaller;
    _siteTypeLabel.textColor = PDFColorTextDetailDefault;
    
    return _siteTypeLabel;
}

- (UILabel *)perCostLabel {
    if (_perCostLabel) {
        return _perCostLabel;
    }
    
    _perCostLabel = [[UILabel alloc] init];
    _perCostLabel.frame = CGRectMake(PDFSpaceSmaller,
                                     VIEW_BOTTOM(_siteTypeLabel) + PDFSpaceBiggish,
                                     kPerLabelWidth,
                                     PDFLabelHeightDetailSmaller);
    
    _perCostLabel.font = PDFFontDetailSmaller;
    _perCostLabel.text = @"支付金额：";
    _perCostLabel.textColor = PDFColorTextDetailDefault;
    
    return _perCostLabel;
}

- (UILabel *)costLabel {
    if (_costLabel) {
        return _costLabel;
    }
    
    _costLabel = [[UILabel alloc] init];
    _costLabel.frame = CGRectMake(VIEW_RIGHT(_perCostLabel),
                                  VIEW_BOTTOM(_siteTypeLabel) + PDFSpaceBiggish,
                                  VIEW_WIDTH(_bgImageView) - PDFSpaceSmaller * 2 - kPerLabelWidth,
                                  PDFLabelHeightDetailSmaller);
    
    _costLabel.font = PDFFontDetailSmaller;
    _costLabel.textColor = PDFColorOrange;
    
    return _costLabel;
}

- (UILabel *)orderTimeLabel {
    if (_orderTimeLabel) {
        return _orderTimeLabel;
    }
    
    _orderTimeLabel = [[UILabel alloc] init];
    _orderTimeLabel.frame = CGRectMake(PDFSpaceSmaller,
                                       VIEW_BOTTOM(_costLabel) + PDFSpaceSmaller,
                                       VIEW_WIDTH(_bgImageView) - PDFSpaceSmaller * 2,
                                       PDFLabelHeightDetailSmaller);
    
    _orderTimeLabel.font = PDFFontDetailSmaller;
    _orderTimeLabel.textColor = PDFColorTextDetailDefault;
    
    return _orderTimeLabel;
}

@end
