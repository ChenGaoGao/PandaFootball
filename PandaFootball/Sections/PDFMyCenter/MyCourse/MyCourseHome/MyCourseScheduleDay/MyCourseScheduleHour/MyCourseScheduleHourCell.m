//
//  MyCourseScheduleHourCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/8.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyCourseScheduleHourCell.h"
#import "PDFUIFormatMacros.h"


static const CGFloat kStartTimeLabelWidth       = 55.0f;
static const CGFloat kStateLabelWidth           = 70.0f;
static const CGFloat kStateLabelHeight          = 32.0f;

@implementation MyCourseScheduleHourCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.startTimeLabel];
        [self addSubview:self.endTimeLabel];
        [self addSubview:self.siteNumberLabel];
        [self addSubview:self.headCountLabel];
        [self addSubview:self.costLabel];
        
        [self addSubview:self.stateLabel];
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
- (UILabel *)startTimeLabel {
    if (!_startTimeLabel) {
        _startTimeLabel = [[UILabel alloc] init];
        _startTimeLabel.frame = CGRectMake(PDFSpaceDefault, PDFSpaceBigger,
                                           kStartTimeLabelWidth, PDFLabelHeightBodyBigger);
        
        _startTimeLabel.font = [UIFont fontWithName:@"DBLCDTempBlack" size:17];
        _startTimeLabel.textColor = PDFColorTextBodyLight;
    }
    return _startTimeLabel;
}

- (UILabel *)endTimeLabel {
    if (!_endTimeLabel) {
        _endTimeLabel = [[UILabel alloc] init];
        _endTimeLabel.frame = CGRectMake(PDFSpaceDefault,
                                         VIEW_BOTTOM(_startTimeLabel) + PDFSpaceSmallish / 2,
                                         kStartTimeLabelWidth,
                                         PDFLabelHeightBodyBigger);
        
        _endTimeLabel.font = PDFFontDetailSmaller;
        _endTimeLabel.textColor = PDFColorTextBodyLight;
    }
    return _endTimeLabel;
}

- (UILabel *)siteNumberLabel {
    if (!_siteNumberLabel) {
        _siteNumberLabel = [[UILabel alloc] init];
        _siteNumberLabel.frame = CGRectMake(VIEW_RIGHT(_startTimeLabel) + PDFSpaceBigger,
                                            PDFSpaceBigger,
                                            kStartTimeLabelWidth,
                                            PDFLabelHeightBodyBigger);
        
        _siteNumberLabel.font = PDFFontDetailDefault;
        _siteNumberLabel.textColor = PDFColorTextBodyLight;
    }
    return _siteNumberLabel;
}

- (UILabel *)headCountLabel {
    if (!_headCountLabel) {
        _headCountLabel = [[UILabel alloc] init];
        _headCountLabel.frame = CGRectMake(VIEW_RIGHT(_startTimeLabel) + PDFSpaceBigger,
                                           VIEW_BOTTOM(_siteNumberLabel) + PDFSpaceSmallish / 2,
                                           kStartTimeLabelWidth,
                                           PDFLabelHeightBodyBigger);
        
        _headCountLabel.font = PDFFontDetailDefault;
        _headCountLabel.textColor = PDFColorTextBodyLight;
    }
    return _headCountLabel;
}

- (UILabel *)costLabel {
    if (!_costLabel) {
        _costLabel = [[UILabel alloc] init];
        _costLabel.frame = CGRectMake(MAIN_WIDTH - PDFSpaceDefault - kStateLabelWidth * 2 - PDFSpaceBiggest,
                                      22.5,
                                      kStateLabelWidth,
                                      kStateLabelHeight);
        
        _costLabel.font = PDFFontDetailDefault;
        _costLabel.textColor = PDFColorOrange;
        _costLabel.textAlignment = NSTextAlignmentRight;
    }
    return _costLabel;
}

- (UILabel *)stateLabel {
    if (!_stateLabel) {
        _stateLabel = [[UILabel alloc] init];
        _stateLabel.frame = CGRectMake(MAIN_WIDTH - PDFSpaceDefault - kStateLabelWidth,
                                       22.5,
                                       kStateLabelWidth,
                                       kStateLabelHeight);
        _stateLabel.backgroundColor = PDFColorGreen;
        
        _stateLabel.font = PDFFontDetailDefault;
        _stateLabel.text = @"已预订";
        _stateLabel.textColor = PDFColorWhite;
        _stateLabel.textAlignment = NSTextAlignmentCenter;
        
        _stateLabel.clipsToBounds = YES;
        _stateLabel.layer.borderWidth = 0.5;
        _stateLabel.layer.borderColor = PDFColorGreen.CGColor;
        _stateLabel.layer.cornerRadius = 3;
    }
    return _stateLabel;
}

@end
