//
//  RecruitTableViewCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/7.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "RecruitTableViewCell.h"
#import "PDFUIFormatMacros.h"


static const CGFloat kIconViewWidth             = 40.0f;
static const CGFloat kIconViewHeight            = 40.0f;
static const CGFloat kRightLabelWidth           = 80.0f;

@interface RecruitTableViewCell ()

@end

@implementation RecruitTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        
        self.backgroundColor = PDFColorWhite;
        
        [self addSubview:self.headerIconView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.teamLabel];
        
        [self addSubview:self.timeLabel];
        [self addSubview:self.addressLabel];
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
- (UIImageView *)headerIconView {
    if (!_headerIconView) {
        _headerIconView = [[UIImageView alloc] init];
        _headerIconView.frame = CGRectMake(PDFSpaceBigger, PDFSpaceSmallish, kIconViewWidth, kIconViewHeight);
        
        _headerIconView.clipsToBounds = YES;
        _headerIconView.contentMode = UIViewContentModeScaleAspectFill;
        
        _headerIconView.layer.borderWidth = 0.5;
        _headerIconView.layer.borderColor = PDFColorLineBorder.CGColor;
        _headerIconView.layer.cornerRadius = kIconViewWidth / 2;
    }
    return _headerIconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(VIEW_RIGHT(_headerIconView) + PDFSpaceSmallest,
                                      VIEW_TOP(_headerIconView) + PDFSpaceSmaller / 2,
                                      MAIN_WIDTH - VIEW_RIGHT(_headerIconView) - PDFSpaceSmallest - PDFSpaceDefault * 2 - kRightLabelWidth,
                                      PDFLabelHeightDetailBigger);
        
        _nameLabel.font = PDFFontDetailBigger;
        _nameLabel.textColor = PDFColorTextBodyDefault;
    }
    return _nameLabel;
}

- (UILabel *)teamLabel {
    if (!_teamLabel) {
        _teamLabel = [[UILabel alloc] init];
        _teamLabel.frame = CGRectMake(VIEW_RIGHT(_headerIconView) + PDFSpaceSmallest,
                                      VIEW_BOTTOM(_nameLabel) + PDFSpaceSmallish / 2,
                                      VIEW_WIDTH(_nameLabel),
                                      PDFLabelHeightDetailSmaller);
        
        _teamLabel.font = PDFFontDetailSmaller;
        _teamLabel.textColor = PDFColorTextDetailDefault;
    }
    return _teamLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.frame = CGRectMake(VIEW_RIGHT(_nameLabel) + PDFSpaceDefault,
                                      VIEW_TOP(_nameLabel),
                                      kRightLabelWidth,
                                      PDFLabelHeightDetailBigger);
        
        _timeLabel.font = PDFFontDetailSmaller;
        _timeLabel.textColor = PDFColorTextDetailDefault;
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.frame = CGRectMake(VIEW_RIGHT(_teamLabel) + PDFSpaceDefault,
                                      VIEW_TOP(_teamLabel),
                                      kRightLabelWidth,
                                      PDFLabelHeightDetailSmaller);
        
        _addressLabel.font = PDFFontDetailSmaller;
        _addressLabel.textColor = PDFColorTextDetailDefault;
        _addressLabel.textAlignment = NSTextAlignmentRight;
    }
    return _addressLabel;
}

@end
