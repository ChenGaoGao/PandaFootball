//
//  SRDetailCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/5.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "SRDetailCell.h"
#import "PDFUIFormatMacros.h"


static const CGFloat kStartTimeLabelWidth       = 55.0f;
static const CGFloat kReservationButtonWidth    = 70.0f;
static const CGFloat kReservationButtonHeight   = 32.0f;

@implementation SRDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.startTimeLabel];
        [self addSubview:self.endTimeLabel];
        [self addSubview:self.siteNumberLabel];
        [self addSubview:self.headCountLabel];
        [self addSubview:self.costLabel];
        
        [self addSubview:self.reservationButton];
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
        _costLabel.frame = CGRectMake(MAIN_WIDTH - PDFSpaceDefault - kReservationButtonWidth * 2 - PDFSpaceBiggest,
                                      22.5,
                                      kReservationButtonWidth,
                                      kReservationButtonHeight);
        
        _costLabel.font = PDFFontDetailDefault;
        _costLabel.textColor = PDFColorOrange;
        _costLabel.textAlignment = NSTextAlignmentRight;
    }
    return _costLabel;
}

- (UIButton *)reservationButton {
    if (!_reservationButton) {
        _reservationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _reservationButton.frame = CGRectMake(MAIN_WIDTH - PDFSpaceDefault - kReservationButtonWidth,
                                              22.5,
                                              kReservationButtonWidth,
                                              kReservationButtonHeight);
        
        [_reservationButton setTitle:@"预定" forState:UIControlStateNormal];
        [_reservationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_reservationButton setBackgroundColor:PDFColorGreen];
        [_reservationButton.titleLabel setFont:PDFFontBodyDefault];
        
        _reservationButton.clipsToBounds = YES;
        _reservationButton.layer.borderWidth = 0.5;
        _reservationButton.layer.borderColor = PDFColorGreen.CGColor;
        _reservationButton.layer.cornerRadius = 3;
    }
    return _reservationButton;
}


@end
