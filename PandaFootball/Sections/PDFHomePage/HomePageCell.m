//
//  HomePageCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/1.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "HomePageCell.h"
#import "PDFUIFormatMacros.h"


static const CGFloat kIconViewWidth         = 75.0f;
static const CGFloat kIconViewHeight        = 75.0f;

@implementation HomePageCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = PDFColorWhite;
        
        [self addSubview:self.iconView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.describeLabel];
    }
    return self;
}

#pragma mark - LazyLoad
- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.frame = CGRectMake((MAIN_WIDTH / 2 - 0.5 - WIDTH_From_4_7(kIconViewWidth)) / 2,
                                     (MAIN_WIDTH / 2 - 0.5 - HEIGHT_From_4_7(kIconViewHeight) -
                                      (PDFLabelHeightBodyBigger + PDFSpaceSmallest + PDFLabelHeightDetailSmallest))
                                     / 15 * 6,
                                     WIDTH_From_4_7(kIconViewWidth), HEIGHT_From_4_7(kIconViewHeight));
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(PDFSpaceDefault,
                                       VIEW_BOTTOM(_iconView) +
                                       (MAIN_WIDTH / 2 - 0.5 - HEIGHT_From_4_7(kIconViewHeight) -
                                        (PDFLabelHeightBodyBigger + PDFSpaceSmallest + PDFLabelHeightDetailSmallest))
                                       / 15 * 5,
                                       MAIN_WIDTH / 2 - 0.5 - PDFSpaceDefault * 2,
                                       PDFLabelHeightBodyBigger);
        
        _titleLabel.font = PDFFontBodyBigger;
        _titleLabel.textColor = PDFColorTextBodyDeep;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)describeLabel {
    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.frame = CGRectMake(PDFSpaceDefault,
                                       VIEW_BOTTOM(_titleLabel) + PDFSpaceSmallest,
                                       MAIN_WIDTH / 2 - 0.5 - PDFSpaceDefault * 2,
                                       PDFLabelHeightDetailSmaller);
        
        _describeLabel.font = PDFFontDetailSmaller;
        _describeLabel.textColor = PDFColorTextDetailLight;
        _describeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _describeLabel;
}

@end
