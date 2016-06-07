//
//  MyCourseScheduleDayCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/2.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyCourseScheduleDayCell.h"
#import "PDFUIFormatMacros.h"



static const CGFloat kLabelWidth        = 55.0f;
static const CGFloat kButtonWidth       = 70.0f;
static const CGFloat kButtonHeight      = 30.0f;

@interface MyCourseScheduleDayCell ()

@property (nonatomic, strong) UILabel *perDateLabel;
@property (nonatomic, strong) UILabel *perTotalSeeeionLabel;        //总场次
@property (nonatomic, strong) UILabel *perReserveSeeeionLabel;      //已预订

@end

@implementation MyCourseScheduleDayCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.perDateLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.perTotalSeeeionLabel];
        [self addSubview:self.totalSeeeionLabel];
        [self addSubview:self.perReserveSeeeionLabel];
        [self addSubview:self.reserveSeeeionLabel];
        [self addSubview:self.checkButton];
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
- (UILabel *)perDateLabel {
    if (_perDateLabel) {
        return _perDateLabel;
    }
    
    _perDateLabel = [[UILabel alloc] init];
    _perDateLabel.frame = CGRectMake(PDFSpaceSmallest, PDFSpaceDefault, kLabelWidth, PDFLabelHeightTabBarDefault);
    
    _perDateLabel.font = PDFFontTabBarDefault;
    _perDateLabel.text = @"日期";
    _perDateLabel.textColor = PDFColorTextDetailDefault;
    _perDateLabel.textAlignment = NSTextAlignmentCenter;
    
    return _perDateLabel;
}

- (UILabel *)dateLabel {
    if (_dateLabel) {
        return _dateLabel;
    }
    
    _dateLabel = [[UILabel alloc] init];
    _dateLabel.frame = CGRectMake(PDFSpaceSmallest,
                                  VIEW_BOTTOM(_perDateLabel) + PDFSpaceBiggish,
                                  kLabelWidth,
                                  PDFLabelHeightDetailDefault);
    
    _dateLabel.font = PDFFontDetailDefault;
    _dateLabel.textColor = PDFColorTextBodyLight;
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    
    return _dateLabel;
}

- (UILabel *)perTotalSeeeionLabel {
    if (_perTotalSeeeionLabel) {
        return _perTotalSeeeionLabel;
    }
    
    _perTotalSeeeionLabel = [[UILabel alloc] init];
    _perTotalSeeeionLabel.frame = CGRectMake(VIEW_RIGHT(_perDateLabel) + PDFSpaceBiggest,
                                             PDFSpaceDefault,
                                             kLabelWidth,
                                             PDFLabelHeightTabBarDefault);
    
    _perTotalSeeeionLabel.font = PDFFontTabBarDefault;
    _perTotalSeeeionLabel.text = @"总场次";
    _perTotalSeeeionLabel.textColor = PDFColorTextDetailDefault;
    _perTotalSeeeionLabel.textAlignment = NSTextAlignmentCenter;
    
    return _perTotalSeeeionLabel;
}

- (UILabel *)totalSeeeionLabel {
    if (_totalSeeeionLabel) {
        return _totalSeeeionLabel;
    }
    
    _totalSeeeionLabel = [[UILabel alloc] init];
    _totalSeeeionLabel.frame = CGRectMake(VIEW_X(_perTotalSeeeionLabel),
                                          VIEW_BOTTOM(_perTotalSeeeionLabel) + PDFSpaceBiggish,
                                          kLabelWidth,
                                          PDFLabelHeightDetailDefault);
    
    _totalSeeeionLabel.font = PDFFontDetailDefault;
    _totalSeeeionLabel.textColor = PDFColorTextBodyLight;
    _totalSeeeionLabel.textAlignment = NSTextAlignmentCenter;
    
    return _totalSeeeionLabel;
}

- (UILabel *)perReserveSeeeionLabel {
    if (_perReserveSeeeionLabel) {
        return _perReserveSeeeionLabel;
    }
    
    _perReserveSeeeionLabel = [[UILabel alloc] init];
    _perReserveSeeeionLabel.frame = CGRectMake(VIEW_RIGHT(_perTotalSeeeionLabel) + PDFSpaceBiggest,
                                               PDFSpaceDefault,
                                               kLabelWidth,
                                               PDFLabelHeightTabBarDefault);
    
    _perReserveSeeeionLabel.font = PDFFontTabBarDefault;
    _perReserveSeeeionLabel.text = @"已预订";
    _perReserveSeeeionLabel.textColor = PDFColorTextDetailDefault;
    _perReserveSeeeionLabel.textAlignment = NSTextAlignmentCenter;
    
    return _perReserveSeeeionLabel;
}

- (UILabel *)reserveSeeeionLabel {
    if (_reserveSeeeionLabel) {
        return _reserveSeeeionLabel;
    }
    
    _reserveSeeeionLabel = [[UILabel alloc] init];
    _reserveSeeeionLabel.frame = CGRectMake(VIEW_X(_perReserveSeeeionLabel),
                                            VIEW_BOTTOM(_perReserveSeeeionLabel) + PDFSpaceBiggish,
                                            kLabelWidth,
                                            PDFLabelHeightDetailDefault);
    
    _reserveSeeeionLabel.font = PDFFontDetailDefault;
    _reserveSeeeionLabel.textColor = PDFColorOrange;
    _reserveSeeeionLabel.textAlignment = NSTextAlignmentCenter;
    
    return _reserveSeeeionLabel;
}

- (UIButton *)checkButton {
    if (_checkButton) {
        return _checkButton;
    }
    
    _checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _checkButton.frame = CGRectMake(MAIN_WIDTH - PDFSpaceDefault - kButtonWidth,
                                    PDFSpaceBigger,
                                    kButtonWidth,
                                    kButtonHeight);
    
    [_checkButton setBackgroundColor:PDFColorGreen];
    [_checkButton setTitle:@"查看" forState:UIControlStateNormal];
    [_checkButton setTitleColor:PDFColorWhite forState:UIControlStateNormal];
    [_checkButton.titleLabel setFont:PDFFontBodySmaller];
    
    _checkButton.clipsToBounds = YES;
    _checkButton.layer.borderWidth = 0.5f;
    _checkButton.layer.borderColor = PDFColorGreen.CGColor;
    _checkButton.layer.cornerRadius = 2.0f;
    
    return _checkButton;
}

@end
