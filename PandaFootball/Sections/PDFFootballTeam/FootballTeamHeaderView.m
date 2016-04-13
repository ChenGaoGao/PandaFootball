//
//  FootballTeamHeaderView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/14.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamHeaderView.h"
#import "PDFUIFormatMacros.h"

static const CGFloat kBackgroundViewHeight      = 210.0f;
static const CGFloat kTranslucentViewHeight     = 58.0f;

@interface FootballTeamHeaderView()

@property (nonatomic, strong) UIView *translucentView;
@property (nonatomic, strong) UILabel *bottomPlayersLabel;
@property (nonatomic, strong) UILabel *bottomSitesLabel;

@end

@implementation FootballTeamHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        
        [self addSubview:self.backgroundView];
        [self addSubview:self.translucentView];
        [self addSubview:self.playersLabel];
        [self addSubview:self.bottomPlayersLabel];
        [self addSubview:self.sitesLabel];
        [self addSubview:self.bottomSitesLabel];
    }
    return self;
}

#pragma mark - LazyLoad
- (UIImageView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIImageView alloc] init];
        _backgroundView.frame = CGRectMake(0, 0, MAIN_WIDTH, HEIGHT_From_4_7(kBackgroundViewHeight));
        _backgroundView.clipsToBounds = YES;
        _backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backgroundView;
}

- (UIView *)translucentView {
    if (!_translucentView) {
        _translucentView = [[UIView alloc] init];
        _translucentView.frame = CGRectMake(0, HEIGHT_From_4_7(kBackgroundViewHeight) - kTranslucentViewHeight,
                                            MAIN_WIDTH, kTranslucentViewHeight);
        
        _translucentView.backgroundColor = PDFColorBlank;
        _translucentView.alpha = 0.3;
    }
    return _translucentView;
}

- (UILabel *)playersLabel {
    if (!_playersLabel) {
        _playersLabel = [[UILabel alloc] init];
        _playersLabel.frame = CGRectMake(PDFSpaceDefault, VIEW_TOP(_translucentView) + PDFSpaceSmallest,
                                         MAIN_WIDTH / 2 - PDFSpaceDefault * 2, PDFLabelHeightBodyDefault);
        
        _playersLabel.font = PDFFontBodyDefault;
        _playersLabel.textColor = PDFColorWhite;
        _playersLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _playersLabel;
}

- (UILabel *)bottomPlayersLabel {
    if (!_bottomPlayersLabel) {
        _bottomPlayersLabel = [[UILabel alloc] init];
        _bottomPlayersLabel.frame = CGRectMake(PDFSpaceDefault, VIEW_BOTTOM(_playersLabel) + PDFSpaceSmallest - 1,
                                         MAIN_WIDTH / 2 - PDFSpaceDefault * 2, PDFLabelHeightDetailDefault);
        
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
        _sitesLabel.frame = CGRectMake(PDFSpaceDefault + MAIN_WIDTH / 2, VIEW_TOP(_translucentView) + PDFSpaceSmallest,
                                         MAIN_WIDTH / 2 - PDFSpaceDefault * 2, PDFLabelHeightBodyDefault);
        
        _sitesLabel.font = PDFFontBodyDefault;
        _sitesLabel.textColor = PDFColorWhite;
        _sitesLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _sitesLabel;
}

- (UILabel *)bottomSitesLabel {
    if (!_bottomSitesLabel) {
        _bottomSitesLabel = [[UILabel alloc] init];
        _bottomSitesLabel.frame = CGRectMake(PDFSpaceDefault + MAIN_WIDTH / 2, VIEW_BOTTOM(_sitesLabel) + PDFSpaceSmallest,
                                         MAIN_WIDTH / 2 - PDFSpaceDefault * 2, PDFLabelHeightDetailDefault);
        
        _bottomSitesLabel.font = PDFFontDetailDefault;
        _bottomSitesLabel.text = @"比赛场次";
        _bottomSitesLabel.textColor = PDFColorTextDetailLight;
        _bottomSitesLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _bottomSitesLabel;
}

@end
