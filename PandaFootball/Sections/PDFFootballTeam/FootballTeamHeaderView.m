//
//  FootballTeamHeaderView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/14.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamHeaderView.h"
#import "PDFUIFormatMacros.h"

#import "PDFSpaceView.h"


static const CGFloat kHeaderViewHeight          = 157.0f;

static const CGFloat kHeadIconViewWidth         = 65.0f;
static const CGFloat kHeadIconViewHeight        = 65.0f;
static const CGFloat kSwitchTeamButtonWidth     = 65.0f;
static const CGFloat kSwitchTeamButtonHeight    = 24.0f;

static const CGFloat kLineViewBottomSpace       = 58.0f;

@interface FootballTeamHeaderView()

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *bottomPlayersLabel;
@property (nonatomic, strong) UILabel *bottomSitesLabel;
@property (nonatomic, strong) UILabel *bottomResultLabel;
@property (nonatomic, strong) PDFSpaceView *spaceView;

@end

@implementation FootballTeamHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.backgroundColor = PDFColorWhite;
        
        [self addSubview:self.headIconView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.sloganLabel];
        [self addSubview:self.switchTeamButton];
        
        [self addSubview:self.lineView];
        [self addSubview:self.playersLabel];
        [self addSubview:self.bottomPlayersLabel];
        [self addSubview:self.sitesLabel];
        [self addSubview:self.bottomSitesLabel];
        [self addSubview:self.resultLabel];
        [self addSubview:self.bottomResultLabel];
        [self addSubview:self.spaceView];
    }
    return self;
}

#pragma mark - LazyLoad
- (UIImageView *)headIconView {
    if (!_headIconView) {
        _headIconView = [[UIImageView alloc] init];
        _headIconView.frame = CGRectMake(PDFSpaceSmaller, PDFSpaceSmaller, kHeadIconViewWidth, kHeadIconViewHeight);
        
        _headIconView.clipsToBounds = YES;
        _headIconView.contentMode = UIViewContentModeScaleAspectFill;
        
        _headIconView.layer.borderWidth = 0.5;
        _headIconView.layer.borderColor = PDFColorLineBorder.CGColor;
        _headIconView.layer.cornerRadius = kHeadIconViewHeight / 2;
    }
    return _headIconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(VIEW_RIGHT(_headIconView) + PDFSpaceSmallest,
                                      VIEW_Y(_headIconView) + PDFSpaceSmallest,
                                      MAIN_WIDTH - PDFSpaceSmaller - VIEW_WIDTH(_headIconView) - PDFSpaceSmallest
                                      - PDFSpaceSmallest - kSwitchTeamButtonWidth - PDFSpaceSmaller,
                                      PDFLabelHeightBodyDefault);
        
        _nameLabel.font = PDFFontBodySmaller;
        _nameLabel.textColor = PDFColorTextBodyDefault;
    }
    return _nameLabel;
}

- (UILabel *)sloganLabel {
    if (!_sloganLabel) {
        _sloganLabel = [[UILabel alloc] init];
        _sloganLabel.frame = CGRectMake(VIEW_RIGHT(_headIconView) + PDFSpaceSmallest,
                                        VIEW_BOTTOM(_nameLabel) + PDFSpaceDefault - PDFLabelHeightBodyDefault / 2,
                                        MAIN_WIDTH - PDFSpaceSmaller - VIEW_WIDTH(_headIconView) - PDFSpaceSmallest
                                        - PDFSpaceSmallest - kSwitchTeamButtonWidth - PDFSpaceSmaller,
                                        PDFLabelHeightBodyDefault * 2);
        
        _sloganLabel.font = PDFFontDetailDefault;
        _sloganLabel.textColor = PDFColorTextDetailDefault;
        _sloganLabel.numberOfLines = 2;
    }
    return _sloganLabel;
}

- (UIButton *)switchTeamButton {
    if (!_switchTeamButton) {
        _switchTeamButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _switchTeamButton.frame = CGRectMake(MAIN_WIDTH - PDFSpaceSmaller - kSwitchTeamButtonWidth,
                                              VIEW_TOP(_nameLabel),
                                              kSwitchTeamButtonWidth,
                                              kSwitchTeamButtonHeight);
        
        [_switchTeamButton setBackgroundColor:PDFColorWhite];
        [_switchTeamButton setTitle:@"切换球队" forState:UIControlStateNormal];
        [_switchTeamButton setTitleColor:PDFColorGreen forState:UIControlStateNormal];
        
        [_switchTeamButton.titleLabel setFont:PDFFontTabBarDefault];
        
        _switchTeamButton.clipsToBounds = YES;
        _switchTeamButton.layer.borderWidth = 0.5;
        _switchTeamButton.layer.borderColor = PDFColorGreen.CGColor;
        _switchTeamButton.layer.cornerRadius = kSwitchTeamButtonHeight / 2;
    }
    return _switchTeamButton;
}


- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.frame = CGRectMake(0, kHeaderViewHeight - kLineViewBottomSpace - PDFSpaceSmallest, MAIN_WIDTH, 0.5);
        
        _lineView.backgroundColor = PDFColorLineSplit;
    }
    return _lineView;
}

- (UILabel *)playersLabel {
    if (!_playersLabel) {
        _playersLabel = [[UILabel alloc] init];
        _playersLabel.frame = CGRectMake(PDFSpaceDefault, VIEW_TOP(_lineView) + PDFSpaceSmallest,
                                         MAIN_WIDTH / 3 - PDFSpaceDefault * 2, PDFLabelHeightBodyDefault);
        
        _playersLabel.font = PDFFontBodyDefault;
        _playersLabel.textColor = PDFColorTextBodyDefault;
        _playersLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _playersLabel;
}

- (UILabel *)bottomPlayersLabel {
    if (!_bottomPlayersLabel) {
        _bottomPlayersLabel = [[UILabel alloc] init];
        _bottomPlayersLabel.frame = CGRectMake(PDFSpaceDefault, VIEW_BOTTOM(_playersLabel) + PDFSpaceSmallest - 1,
                                               MAIN_WIDTH / 3 - PDFSpaceDefault * 2, PDFLabelHeightDetailDefault);
        
        _bottomPlayersLabel.font = PDFFontDetailDefault;
        _bottomPlayersLabel.text = @"球员人数";
        _bottomPlayersLabel.textColor = PDFColorTextDetailLight;
        _bottomPlayersLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _bottomPlayersLabel;
}

- (UILabel *)sitesLabel {
    if (!_sitesLabel) {
        _sitesLabel = [[UILabel alloc] init];
        _sitesLabel.frame = CGRectMake(PDFSpaceDefault + MAIN_WIDTH / 3, VIEW_TOP(_lineView) + PDFSpaceSmallest,
                                       MAIN_WIDTH / 3 - PDFSpaceDefault * 2, PDFLabelHeightBodyDefault);
        
        _sitesLabel.font = PDFFontBodyDefault;
        _sitesLabel.textColor = PDFColorTextBodyDefault;
        _sitesLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _sitesLabel;
}

- (UILabel *)bottomSitesLabel {
    if (!_bottomSitesLabel) {
        _bottomSitesLabel = [[UILabel alloc] init];
        _bottomSitesLabel.frame = CGRectMake(PDFSpaceDefault + MAIN_WIDTH / 3,
                                             VIEW_BOTTOM(_sitesLabel) + PDFSpaceSmallest,
                                             MAIN_WIDTH / 3 - PDFSpaceDefault * 2,
                                             PDFLabelHeightDetailDefault);
        
        _bottomSitesLabel.font = PDFFontDetailDefault;
        _bottomSitesLabel.text = @"比赛场次";
        _bottomSitesLabel.textColor = PDFColorTextDetailLight;
        _bottomSitesLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _bottomSitesLabel;
}

- (UILabel *)resultLabel {
    if (!_resultLabel) {
        _resultLabel = [[UILabel alloc] init];
        _resultLabel.frame = CGRectMake(PDFSpaceDefault + MAIN_WIDTH  * 2 / 3,
                                        VIEW_TOP(_lineView) + PDFSpaceSmallest,
                                        MAIN_WIDTH / 3 - PDFSpaceDefault * 2,
                                        PDFLabelHeightBodyDefault);
        
        _resultLabel.font = PDFFontBodyDefault;
        _resultLabel.textColor = PDFColorTextBodyDefault;
        _resultLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _resultLabel;
}

- (UILabel *)bottomResultLabel {
    if (!_bottomResultLabel) {
        _bottomResultLabel = [[UILabel alloc] init];
        _bottomResultLabel.frame = CGRectMake(PDFSpaceDefault + MAIN_WIDTH * 2/ 3,
                                              VIEW_BOTTOM(_sitesLabel) + PDFSpaceSmallest,
                                              MAIN_WIDTH / 3 - PDFSpaceDefault * 2,
                                              PDFLabelHeightDetailDefault);
        
        _bottomResultLabel.font = PDFFontDetailDefault;
        _bottomResultLabel.text = @"胜/平/负";
        _bottomResultLabel.textColor = PDFColorTextDetailLight;
        _bottomResultLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _bottomResultLabel;
}

- (PDFSpaceView *)spaceView {
    if (!_spaceView) {
        _spaceView = [[PDFSpaceView alloc] init];
        _spaceView.frame = CGRectMake(0, VIEW_BOTTOM(_bottomPlayersLabel) + PDFSpaceSmallest,
                                      MAIN_WIDTH, PDFSpaceSmallest);
    }
    return _spaceView;
}

@end
