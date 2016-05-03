//
//  FootballTeamAttendanceCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/3.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamAttendanceCell.h"
#import "PDFUIFormatMacros.h"

static const CGFloat kTableViewCellHeight        = 44.0f;

@interface FootballTeamAttendanceCell()

@end

@implementation FootballTeamAttendanceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        
        [self addSubview:self.identifyLabel];
        [self addSubview:self.playerNameLabel];
        [self addSubview:self.attendanceTimeLabel];
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
- (UILabel *)identifyLabel {
    if (!_identifyLabel) {
        _identifyLabel = [[UILabel alloc] init];
        _identifyLabel.frame = CGRectMake(PDFSpaceDefault * 2, PDFSpaceSmaller, PDFSpaceBigger, PDFSpaceBigger);
        
        _identifyLabel.font = PDFFontTabBarDefault;
        _identifyLabel.textColor = PDFColorWhite;
        _identifyLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _identifyLabel;
}

- (UILabel *)playerNameLabel {
    if (!_playerNameLabel) {
        _playerNameLabel = [[UILabel alloc] init];
        _playerNameLabel.frame = CGRectMake(VIEW_RIGHT(_identifyLabel) + PDFSpaceDefault, 0,
                                            MAIN_WIDTH - VIEW_RIGHT(_identifyLabel) - PDFSpaceDefault * 2,
                                            kTableViewCellHeight);
        
        _playerNameLabel.font = PDFFontDetailBigger;
        _playerNameLabel.textColor = PDFColorTextBodyLight;
        _playerNameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _playerNameLabel;
}

//- (UILabel *)attendanceTimeLabel {
//    if (!_attendanceTimeLabel) {
//        _attendanceTimeLabel = [[UILabel alloc] init];
//        _attendanceTimeLabel.frame = CGRectMake(VIEW_RIGHT(_playerNameLabel) +, 0, <#CGFloat width#>, kTableViewCellHeight);
//    }
//    return _attendanceTimeLabel;
//}

@end
