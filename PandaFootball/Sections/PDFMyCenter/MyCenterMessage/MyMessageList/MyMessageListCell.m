//
//  MyMessageListCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/31.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyMessageListCell.h"
#import "PDFUIFormatMacros.h"



static const CGFloat kIconViewWidth     = 18.0f;
static const CGFloat kTimeLabelWidth    = 40.0f;


@implementation MyMessageListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.iconView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.detailLabel];
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
- (UIImageView *)iconView {
    if (_iconView) {
        return _iconView;
    }
    
    _iconView = [UIImageView new];
    _iconView.frame = CGRectMake(PDFSpaceDefault, PDFSpaceDefault - 2, kIconViewWidth, kIconViewWidth);
    
    return _iconView;
}

- (UILabel *)titleLabel {
    if (_titleLabel) {
        return _titleLabel;
    }
    
    _titleLabel = [UILabel new];
    _titleLabel.frame = CGRectMake(VIEW_RIGHT(_iconView) + PDFSpaceSmaller,
                                   PDFSpaceDefault,
                                   MAIN_WIDTH - VIEW_RIGHT(_iconView) - PDFSpaceSmaller * 2 - kTimeLabelWidth,
                                   PDFLabelHeightDetailBigger);
    
    _titleLabel.font = PDFFontDetailBigger;
    _titleLabel.textColor = PDFColorTextBodyLight;
    
    return _titleLabel;
}

- (UILabel *)timeLabel {
    if (_timeLabel) {
        return _timeLabel;
    }
    
    _timeLabel = [UILabel new];
    _timeLabel.frame = CGRectMake(VIEW_RIGHT(_titleLabel),
                                  PDFSpaceDefault,
                                  kTimeLabelWidth,
                                  PDFLabelHeightDetailBigger);
    
    _timeLabel.font = PDFFontDetailSmaller;
    _timeLabel.textColor = PDFColorTextDetailDefault;
    _timeLabel.textAlignment = NSTextAlignmentRight;
    
    return _timeLabel;
}

- (UILabel *)detailLabel {
    if (_detailLabel) {
        return _detailLabel;
    }
    
    _detailLabel = [UILabel new];
    _detailLabel.frame = CGRectMake(VIEW_LEFT(_titleLabel),
                                    VIEW_BOTTOM(_titleLabel) + PDFSpaceSmallest,
                                    VIEW_WIDTH(_titleLabel) + kTimeLabelWidth,
                                    PDFLabelHeightDetailSmaller);
    
    _detailLabel.font = PDFFontDetailSmaller;
    _detailLabel.textColor = PDFColorTextDetailDefault;
    
    return _detailLabel;
}

@end
