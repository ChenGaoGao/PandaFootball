//
//  MyCourseScheduleTemplateDetailCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/14.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyCourseScheduleTemplateDetailCell.h"
#import "PDFUIFormatMacros.h"
#import "PDFSpaceView.h"


static const CGFloat kStartTimeLabelWidth       = 55.0f;
const static CGFloat kButtonWidth               = 36.0f;
const static CGFloat kButtonHeight              = 57.0f;


@interface MyCourseScheduleTemplateDetailCell ()

@property (nonatomic, strong) PDFSpaceView *spaceView;

@end

@implementation MyCourseScheduleTemplateDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.spaceView];
        [self addSubview:self.startTimeLabel];
        [self addSubview:self.endTimeLabel];
        [self addSubview:self.siteNumberLabel];
        [self addSubview:self.headCountLabel];
        [self addSubview:self.costLabel];
        
        [self addSubview:self.editButton];
        [self addSubview:self.deleteButton];
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
- (PDFSpaceView *)spaceView {
    if (!_spaceView) {
        _spaceView = [[PDFSpaceView alloc] init];
        _spaceView.frame = CGRectMake(0, 0, MAIN_WIDTH, PDFSpaceSmallest);
    }
    return _spaceView;
}

- (UILabel *)startTimeLabel {
    if (!_startTimeLabel) {
        _startTimeLabel = [[UILabel alloc] init];
        _startTimeLabel.frame = CGRectMake(PDFSpaceDefault, VIEW_BOTTOM(_spaceView) + PDFSpaceSmallest,
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
                                            VIEW_BOTTOM(_spaceView) + PDFSpaceSmallest,
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
        _costLabel.frame = CGRectMake(VIEW_RIGHT(_siteNumberLabel) + PDFSpaceDefault,
                                      VIEW_BOTTOM(_spaceView),
                                      MAIN_WIDTH - (VIEW_RIGHT(_siteNumberLabel) + PDFSpaceDefault)
                                      - (kButtonWidth * 2 + PDFSpaceSmallest)
                                      ,
                                      kButtonHeight);
        
        _costLabel.font = PDFFontDetailDefault;
        _costLabel.textColor = PDFColorOrange;
        _costLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _costLabel;
}

- (UIButton *)editButton {
    if (_editButton) {
        return _editButton;
    }
    _editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _editButton.frame = CGRectMake(VIEW_RIGHT(_costLabel), VIEW_BOTTOM(_spaceView), kButtonWidth, kButtonHeight);
    
    _editButton.backgroundColor = PDFColorRed;
    
    return _editButton;
}

- (UIButton *)deleteButton {
    if (_deleteButton) {
        return _deleteButton;
    }
    _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleteButton.frame = CGRectMake(VIEW_RIGHT(_editButton), VIEW_BOTTOM(_spaceView), kButtonWidth, kButtonHeight);
    
    _deleteButton.backgroundColor = PDFColorGreen;
    
    return _deleteButton;
}
@end
