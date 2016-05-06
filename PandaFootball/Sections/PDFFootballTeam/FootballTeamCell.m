//
//  FootballTeamCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/14.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamCell.h"
#import "PDFUIFormatMacros.h"

static const CGFloat kIconViewWidth         = 25.0f;

@interface FootballTeamCell ()

@property (nonatomic, strong) UIView *leftLineView;
@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation FootballTeamCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = PDFColorWhite;
        
        [self addSubview:self.iconView];
        [self addSubview:self.titleLabel];
        
        [self addSubview:self.leftLineView];
        [self addSubview:self.bottomLineView];
        
        self.lineType = FBTCellLineTypeLeftBottom;
    }
    return self;
}

#pragma mark - Setters
- (void)setLineType:(FBTCellLineType)lineType {
    _lineType = lineType;
    
    if (lineType == FBTCellLineTypeLeftBottom) {
        self.leftLineView.hidden = NO;
        self.bottomLineView.hidden = NO;
    }
    
    if (lineType == FBTCellLineTypeBottom) {
        self.leftLineView.hidden = YES;
        self.bottomLineView.hidden = NO;
    }
}

#pragma mark - LazyLoad
- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.frame = CGRectMake(MAIN_WIDTH / 3 / 2 - kIconViewWidth / 2, HEIGHT_From_4_7(PDFSpaceBigger),
                                     kIconViewWidth, kIconViewHeight);
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(PDFSpaceDefault, VIEW_BOTTOM(_iconView) + PDFSpaceSmaller,
                                       MAIN_WIDTH / 3 - PDFSpaceDefault * 2, PDFLabelHeightDetailSmaller);
        
        _titleLabel.font = [UIFont boldSystemFontOfSize:12.0f];
        _titleLabel.textColor = PDFColorTextBodyDeep;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIView *)leftLineView {
    if (!_leftLineView) {
        _leftLineView = [[UIView alloc] init];
        _leftLineView.frame = CGRectMake(0, 0,
                                         0.5, HEIGHT_From_4_7(PDFSpaceBigger) * 2 + kIconViewHeight + PDFSpaceSmaller + PDFLabelHeightDetailSmaller);
        
        _leftLineView.backgroundColor = PDFColorLineSplit;
    }
    return _leftLineView;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.frame = CGRectMake(0, HEIGHT_From_4_7(PDFSpaceBigger) * 2 + kIconViewHeight +
                                           PDFSpaceSmaller + PDFLabelHeightDetailSmaller - 0.5,
                                           MAIN_WIDTH / 3, 0.5);
        
        _bottomLineView.backgroundColor = PDFColorLineSplit;
    }
    return _bottomLineView;
}

@end
