//
//  SRDetailHeaderView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/13.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "SRDetailHeaderView.h"
#import "PDFUIFormatMacros.h"

static const CGFloat kImageViewHeight       = 125.0f;
static const CGFloat kAddressLabelHeight    = 41.0f;

@interface SRDetailHeaderView()

@property (nonatomic, strong) UIView *addressBackgroundView;

@end

@implementation SRDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        
        [self addSubview:self.siteImageView];
        [self addSubview:self.addressBackgroundView];
        [self addSubview:self.siteAddressLabel];
    }
    return self;
}

#pragma mark - LazyLoad
- (UIImageView *)siteImageView {
    if (!_siteImageView) {
        _siteImageView = [[UIImageView alloc] init];
        _siteImageView.frame = CGRectMake(0, 0, MAIN_WIDTH, HEIGHT_From_4_7(kImageViewHeight));
        
        _siteImageView.clipsToBounds = YES;
        _siteImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _siteImageView;
}

- (UIView *)addressBackgroundView {
    if (!_addressBackgroundView) {
        _addressBackgroundView = [[UIView alloc] init];
        _addressBackgroundView.frame = CGRectMake(0, VIEW_BOTTOM(_siteImageView),
                                                  MAIN_WIDTH, kAddressLabelHeight);
        
        _addressBackgroundView.backgroundColor = PDFColorWhite;
    }
    return _addressBackgroundView;
}

- (UILabel *)siteAddressLabel {
    if (!_siteAddressLabel) {
        _siteAddressLabel = [[UILabel alloc] init];
        _siteAddressLabel.frame = CGRectMake(PDFSpaceSmaller, VIEW_BOTTOM(_siteImageView),
                                             MAIN_WIDTH - PDFSpaceSmaller * 2, kAddressLabelHeight);
        
        _siteAddressLabel.backgroundColor = PDFColorWhite;
        _siteAddressLabel.font = PDFFontBodyBigger;
        _siteAddressLabel.textColor = PDFColorTextBodyDeep;
    }
    return _siteAddressLabel;
}

@end
