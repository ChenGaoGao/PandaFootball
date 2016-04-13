//
//  PDFSiteReservationCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/13.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFSiteReservationCell.h"
#import "PDFUIFormatMacros.h"

static const CGFloat kSiteImageViewWidth        = 85.0f;
static const CGFloat kSiteImageViewHeight       = 65.0f;

@implementation PDFSiteReservationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.siteImageView];
        [self addSubview:self.siteNameLabel];
        [self addSubview:self.siteAddressLabel];
    }
    return self;
}

#pragma mark - LazyLoad
- (UIImageView *)siteImageView {
    if (!_siteImageView) {
        _siteImageView = [[UIImageView alloc] init];
        _siteImageView.frame = CGRectMake(PDFSpaceSmaller, PDFSpaceSmaller, kSiteImageViewWidth, kSiteImageViewHeight);
        
        _siteImageView.clipsToBounds = YES;
        _siteImageView.layer.borderWidth = 0.5;
        _siteImageView.layer.borderColor = PDFColorBorderLine.CGColor;
        _siteImageView.layer.cornerRadius = 3;
    }
    return _siteImageView;
}

- (UILabel *)siteNameLabel {
    if (!_siteNameLabel) {
        _siteNameLabel = [[UILabel alloc] init];
        _siteNameLabel.frame = CGRectMake(VIEW_RIGHT(_siteImageView) + PDFSpaceSmallest,
                                          VIEW_Y(_siteImageView) + 3,
                                          MAIN_WIDTH - VIEW_WIDTH(_siteImageView) - PDFSpaceSmallest - PDFSpaceSmaller * 2,
                                          PDFLabelHeightBodyDefault);
        
        _siteNameLabel.font = PDFFontBodyDefault;
        _siteNameLabel.textColor = PDFColorTextBodyDefault;
    }
    return _siteNameLabel;
}

- (UILabel *)siteAddressLabel {
    if (!_siteAddressLabel) {
        _siteAddressLabel = [[UILabel alloc] init];
        _siteAddressLabel.frame = CGRectMake(VIEW_RIGHT(_siteImageView) + PDFSpaceSmallest,
                                          VIEW_BOTTOM(_siteNameLabel) + PDFSpaceDefault,
                                          MAIN_WIDTH - VIEW_WIDTH(_siteImageView) - PDFSpaceSmallest - PDFSpaceSmaller * 2,
                                          PDFLabelHeightBodyDefault * 2);
        
        _siteAddressLabel.font = PDFFontDetailDefault;
        _siteAddressLabel.textColor = PDFColorTextDetailDefault;
        
        _siteAddressLabel.numberOfLines = 2;
        _siteAddressLabel.lineBreakMode = NSLineBreakByCharWrapping;
    }
    return _siteAddressLabel;
}

@end
