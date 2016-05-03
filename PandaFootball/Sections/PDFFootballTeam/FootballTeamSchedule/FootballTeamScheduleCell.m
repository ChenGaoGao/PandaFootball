//
//  FootballTeamScheduleCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/21.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamScheduleCell.h"
#import "PDFPCHMacro.h"

static const CGFloat kIconViewWidth         = 32.0f;
static const CGFloat kIconViewHeight        = 32.0f;


@interface FootballTeamScheduleCell()

@end

@implementation FootballTeamScheduleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        
        [self addSubview:self.hostTeamIconView];
        [self addSubview:self.hostTeamNameLabel];
        [self addSubview:self.guestTeamIconView];
        [self addSubview:self.guestTeamNameLabel];
        
        [self addSubview:self.versusScoreLabel];
        [self addSubview:self.versusTimeLabel];
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

#pragma mark - Setters
- (void)setVersusState:(FBTSCVersusState)versusState {
    _versusState = versusState;
    
    if (_versusState == FBTSCVersusStateUnfinished) {
        _versusScoreLabel.text = @"VS";
        _versusScoreLabel.textColor = PDFColorGreen;
    }
    
    if (_versusState == FBTSCVersusStateFinished) {
        _versusScoreLabel.textColor = PDFColorOrange;
    }
}

#pragma mark - LazyLoad
- (UIImageView *)hostTeamIconView {
    if (!_hostTeamIconView) {
        _hostTeamIconView = [[UIImageView alloc] init];
        _hostTeamIconView.frame = CGRectMake(PDFSpaceDefault * 2, PDFSpaceSmaller, kIconViewWidth, kIconViewHeight);
        
        _hostTeamIconView.clipsToBounds = YES;
        _hostTeamIconView.contentMode = UIViewContentModeScaleAspectFill;
        
        _hostTeamIconView.layer.borderWidth = 0.5;
        _hostTeamIconView.layer.borderColor = PDFColorLineBorder.CGColor;
        _hostTeamIconView.layer.cornerRadius = kIconViewWidth / 2;
    }
    return _hostTeamIconView;
}

- (UILabel *)hostTeamNameLabel {
    if (!_hostTeamNameLabel) {
        _hostTeamNameLabel = [[UILabel alloc] init];
        _hostTeamNameLabel.frame = CGRectMake(PDFSpaceSmaller,
                                              VIEW_BOTTOM(_hostTeamIconView) + PDFSpaceSmallish / 2,
                                              kIconViewWidth + PDFSpaceDefault * 2 * 2 - PDFSpaceSmaller * 2,
                                              PDFLabelHeightDetailDefault);
        
        _hostTeamNameLabel.font = PDFFontDetailDefault;
        _hostTeamNameLabel.textColor = PDFColorTextBodyLight;
        _hostTeamNameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _hostTeamNameLabel;
}

- (UIImageView *)guestTeamIconView {
    if (!_guestTeamIconView) {
        _guestTeamIconView = [[UIImageView alloc] init];
        _guestTeamIconView.frame = CGRectMake(MAIN_WIDTH - kIconViewWidth - PDFSpaceDefault * 2, PDFSpaceSmaller, kIconViewWidth, kIconViewHeight);
        
        _guestTeamIconView.clipsToBounds = YES;
        _guestTeamIconView.contentMode = UIViewContentModeScaleAspectFill;
        
        _guestTeamIconView.layer.borderWidth = 0.5;
        _guestTeamIconView.layer.borderColor = PDFColorLineBorder.CGColor;
        _guestTeamIconView.layer.cornerRadius = kIconViewWidth / 2;
    }
    return _guestTeamIconView;
}

- (UILabel *)guestTeamNameLabel {
    if (!_guestTeamNameLabel) {
        _guestTeamNameLabel = [[UILabel alloc] init];
        _guestTeamNameLabel.frame = CGRectMake(MAIN_WIDTH - (kIconViewWidth + PDFSpaceDefault * 2 * 2 - PDFSpaceSmaller * 2) -PDFSpaceSmaller,
                                               VIEW_BOTTOM(_hostTeamIconView) + PDFSpaceSmallish / 2,
                                               kIconViewWidth + PDFSpaceDefault * 2 * 2 - PDFSpaceSmaller * 2,
                                               PDFLabelHeightDetailDefault);
        
        _guestTeamNameLabel.font = PDFFontDetailDefault;
        _guestTeamNameLabel.textColor = PDFColorTextBodyLight;
        _guestTeamNameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _guestTeamNameLabel;
}

- (UILabel *)versusScoreLabel {
    if (!_versusScoreLabel) {
        _versusScoreLabel = [[UILabel alloc] init];
        _versusScoreLabel.frame = CGRectMake(VIEW_RIGHT(_hostTeamIconView),
                                             PDFSpaceBigger,
                                             MAIN_WIDTH - VIEW_WIDTH(_hostTeamIconView) * 2 - PDFSpaceDefault * 2 * 2,
                                             PDFLabelHeightBodyDefault);
        
        _versusScoreLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        _versusScoreLabel.text = @"VS";
        _versusScoreLabel.textColor = PDFColorGreen;
        _versusScoreLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _versusScoreLabel;
}

- (UILabel *)versusTimeLabel {
    if (!_versusTimeLabel) {
        _versusTimeLabel = [[UILabel alloc] init];
        _versusTimeLabel.frame = CGRectMake(VIEW_RIGHT(_hostTeamIconView),
                                            VIEW_BOTTOM(_versusScoreLabel) + PDFSpaceSmallest,
                                            MAIN_WIDTH - VIEW_WIDTH(_hostTeamIconView) * 2 - PDFSpaceDefault * 2 * 2,
                                            PDFLabelHeightDetailSmaller);
        
        _versusTimeLabel.font = PDFFontTabBarDefault;
        _versusTimeLabel.textColor = PDFColorTextDetailDefault;
        _versusTimeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _versusTimeLabel;
}

@end
