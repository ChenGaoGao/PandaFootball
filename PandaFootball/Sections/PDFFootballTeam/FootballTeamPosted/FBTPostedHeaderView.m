//
//  FBTPostedHeaderView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/10.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FBTPostedHeaderView.h"
#import "PDFUIFormatMacros.h"



static const CGFloat kIconViewWidth             = 40.0f;
static const CGFloat kHeaderViewHeight          = 68.0f;

@interface FBTPostedHeaderView ()

@property (nonatomic, strong) UIView *lineView;

@end

@implementation FBTPostedHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headerIcon];
        [self addSubview:self.teamNameLabel];
        [self addSubview:self.addressLabel];
        
        [self addSubview:self.lineView];
    }
    return self;
}

#pragma mark - LazyLoad
- (UIImageView *)headerIcon {
    if (!_headerIcon) {
        _headerIcon = [[UIImageView alloc] init];
        _headerIcon.frame = CGRectMake(PDFSpaceBigger, PDFSpaceSmallish, kIconViewWidth, kIconViewWidth);
        
        _headerIcon.clipsToBounds = YES;
        _headerIcon.contentMode = UIViewContentModeScaleAspectFill;
        
        _headerIcon.layer.borderWidth = 0.5;
        _headerIcon.layer.borderColor = PDFColorLineBorder.CGColor;
        _headerIcon.layer.cornerRadius = kIconViewWidth / 2;
    }
    return _headerIcon;
}

- (UILabel *)teamNameLabel {
    if (!_teamNameLabel) {
        _teamNameLabel = [[UILabel alloc] init];
        _teamNameLabel.frame = CGRectMake(VIEW_RIGHT(_headerIcon) + PDFSpaceSmallest,
                                          VIEW_TOP(_headerIcon) + PDFSpaceSmaller / 2,
                                          MAIN_WIDTH - VIEW_RIGHT(_headerIcon) - PDFSpaceSmallest,
                                          PDFLabelHeightDetailBigger);
        
        _teamNameLabel.font = PDFFontDetailBigger;
        _teamNameLabel.textColor = PDFColorTextBodyDefault;
    }
    return _teamNameLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.frame = CGRectMake(VIEW_RIGHT(_headerIcon) + PDFSpaceSmallest,
                                         VIEW_BOTTOM(_teamNameLabel) + PDFSpaceSmallish / 2,
                                         VIEW_WIDTH(_teamNameLabel),
                                         PDFLabelHeightDetailSmaller);
        
        _addressLabel.font = PDFFontDetailSmaller;
        _addressLabel.textColor = PDFColorTextDetailDefault;
    }
    return _addressLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.frame = CGRectMake(0, kHeaderViewHeight - 0.5, MAIN_WIDTH, 0.5);
        
        _lineView.backgroundColor = PDFColorLineSplit;
    }
    return _lineView;
}

@end
