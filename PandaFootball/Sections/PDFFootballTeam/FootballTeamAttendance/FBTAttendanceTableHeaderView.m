//
//  FBTAttendanceTableHeaderView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/4.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FBTAttendanceTableHeaderView.h"
#import "PDFUIFormatMacros.h"
#import "PDFSpaceView.h"

static const CGFloat kIconViewWidth             = 40.0f;
static const CGFloat kIconViewHeight            = 40.0f;
static const CGFloat kPerLabelHeight            = 32.0f;


@interface FBTAttendanceTableHeaderView ()

@property (nonatomic, strong) PDFSpaceView *spaceView;
@property (nonatomic, strong) UILabel *perRankingLabel;
@property (nonatomic, strong) UILabel *perPlayerLabel;
@property (nonatomic, strong) UILabel *perCountLabel;

@end

@implementation FBTAttendanceTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = PDFColorWhite;
        
        [self addSubview:self.headerIconView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.rankingLabel];
        [self addSubview:self.attendanceCountLabel];
        
        [self addSubview:self.spaceView];
        [self addSubview:self.perRankingLabel];
        [self addSubview:self.perPlayerLabel];
        [self addSubview:self.perCountLabel];
    }
    return self;
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
                                      VIEW_TOP(_headerIconView) + PDFSpaceSmallish / 2,
                                      MAIN_WIDTH - VIEW_RIGHT(_headerIconView) - PDFSpaceSmallest - (PDFSpaceDefault * 2 * 2 + PDFSpaceBigger),
                                      PDFLabelHeightDetailBigger);
        
        _nameLabel.font = PDFFontDetailBigger;
        _nameLabel.textColor = PDFColorTextBodyDefault;
    }
    return _nameLabel;
}

- (UILabel *)rankingLabel {
    if (!_rankingLabel) {
        _rankingLabel = [[UILabel alloc] init];
        _rankingLabel.frame = CGRectMake(VIEW_RIGHT(_headerIconView) + PDFSpaceSmallest,
                                         VIEW_BOTTOM(_nameLabel) + PDFSpaceSmallish / 2,
                                         VIEW_WIDTH(_nameLabel),
                                         PDFLabelHeightDetailSmaller);
        
        _rankingLabel.font = PDFFontDetailSmaller;
        _rankingLabel.textColor = PDFColorTextDetailDefault;
    }
    return _rankingLabel;
}

- (UILabel *)attendanceCountLabel {
    if (!_attendanceCountLabel) {
        _attendanceCountLabel = [[UILabel alloc] init];
        _attendanceCountLabel.frame = CGRectMake(VIEW_RIGHT(_nameLabel) + PDFSpaceDefault, 0,
                                                 PDFSpaceDefault * 2 + PDFSpaceBigger,
                                                 PDFSpaceSmallish * 2 + kIconViewHeight);
        
        _attendanceCountLabel.font = PDFFontBodyBiggest;
        _attendanceCountLabel.textColor = PDFColorOrange;
        _attendanceCountLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _attendanceCountLabel;
}

- (PDFSpaceView *)spaceView {
    if (!_spaceView) {
        _spaceView = [[PDFSpaceView alloc] init];
        _spaceView.frame = CGRectMake(0, VIEW_BOTTOM(_headerIconView) + PDFSpaceSmallish,
                                      MAIN_WIDTH, PDFSpaceSmallest);
    }
    return _spaceView;
}

- (UILabel *)perRankingLabel {
    if (!_perRankingLabel) {
        _perRankingLabel = [[UILabel alloc] init];
        _perRankingLabel.frame = CGRectMake(PDFSpaceDefault, VIEW_BOTTOM(_spaceView),
                                            PDFSpaceDefault * 2 + PDFSpaceBigger, kPerLabelHeight);
        
        _perRankingLabel.font = PDFFontDetailSmaller;
        _perRankingLabel.text = @"排名";
        _perRankingLabel.textColor = PDFColorTextBodyLight;
        _perRankingLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _perRankingLabel;
}

- (UILabel *)perPlayerLabel {
    if (!_perPlayerLabel) {
        _perPlayerLabel = [[UILabel alloc] init];
        _perPlayerLabel.frame = CGRectMake(VIEW_RIGHT(_perRankingLabel) + PDFSpaceDefault,
                                           VIEW_BOTTOM(_spaceView),
                                           MAIN_WIDTH - (PDFSpaceDefault * 2 * 2 + PDFSpaceBigger) * 2,
                                           kPerLabelHeight);
        
        _perPlayerLabel.font = PDFFontDetailSmaller;
        _perPlayerLabel.text = @"球员";
        _perPlayerLabel.textColor = PDFColorTextBodyLight;
        _perPlayerLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _perPlayerLabel;
}

- (UILabel *)perCountLabel {
    if (!_perCountLabel) {
        _perCountLabel = [[UILabel alloc] init];
        _perCountLabel.frame = CGRectMake(VIEW_RIGHT(_perPlayerLabel) + PDFSpaceDefault,
                                          VIEW_BOTTOM(_spaceView),
                                          MAIN_WIDTH - VIEW_RIGHT(_perPlayerLabel) - PDFSpaceDefault * 2,
                                          kPerLabelHeight);
        
        _perCountLabel.font = PDFFontDetailSmaller;
        _perCountLabel.text = @"出勤次数";
        _perCountLabel.textColor = PDFColorTextBodyLight;
        _perCountLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _perCountLabel;
}

@end
