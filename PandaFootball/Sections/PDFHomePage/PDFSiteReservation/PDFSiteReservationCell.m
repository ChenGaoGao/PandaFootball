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

static const CGFloat kAddressIconViewWidth      = 13.0f;
static const CGFloat kAddressIconViewHeight     = 13.0f;

static const CGFloat kReservationButtonWidth    = 50.0f;
static const CGFloat kReservationButtonHeight   = 18.0f;

@interface PDFSiteReservationCell()

@property (nonatomic, strong) UIImageView *addressIconView;

@end

@implementation PDFSiteReservationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.siteImageView];
        [self addSubview:self.siteNameLabel];
        [self addSubview:self.addressIconView];
        [self addSubview:self.siteAddressLabel];
        
        [self addSubview:self.reservationButton];
        
        self.reservationType = SRCellReservationTypeEnable;
    }
    return self;
}

#pragma mark - Setters
- (void)setReservationType:(SRCellReservationType)reservationType {
    _reservationType = reservationType;
    
    if (_reservationType == SRCellReservationTypeEnable) {
        self.reservationButton.selected = NO;
        _reservationButton.layer.borderColor = PDFColorGreen.CGColor;
    }
    
    if (_reservationType == SRCellReservationTypeUnable) {
        self.reservationButton.selected = YES;
        _reservationButton.layer.borderColor = PDFColorTextDetailDefault.CGColor;
    }
}

#pragma mark - LazyLoad
- (UIImageView *)siteImageView {
    if (!_siteImageView) {
        _siteImageView = [[UIImageView alloc] init];
        _siteImageView.frame = CGRectMake(PDFSpaceSmaller, PDFSpaceSmaller, kSiteImageViewWidth, kSiteImageViewHeight);
        
        _siteImageView.clipsToBounds = YES;
        _siteImageView.contentMode = UIViewContentModeScaleAspectFill;
        
        _siteImageView.layer.borderWidth = 0.5;
        _siteImageView.layer.borderColor = PDFColorLineBorder.CGColor;
        _siteImageView.layer.cornerRadius = 3;
    }
    return _siteImageView;
}

- (UILabel *)siteNameLabel {
    if (!_siteNameLabel) {
        _siteNameLabel = [[UILabel alloc] init];
        _siteNameLabel.frame = CGRectMake(VIEW_RIGHT(_siteImageView) + PDFSpaceSmallest,
                                          VIEW_Y(_siteImageView) + PDFSpaceSmallest,
                                          MAIN_WIDTH - PDFSpaceSmaller - VIEW_WIDTH(_siteImageView) - PDFSpaceSmallest
                                          - PDFSpaceSmallest - kReservationButtonWidth - PDFSpaceSmaller,
                                          PDFLabelHeightBodyDefault);
        
        _siteNameLabel.font = PDFFontBodySmaller;
        _siteNameLabel.textColor = PDFColorTextBodyDefault;
    }
    return _siteNameLabel;
}

- (UIImageView *)addressIconView {
    if (!_addressIconView) {
        _addressIconView = [[UIImageView alloc] init];
        _addressIconView.frame = CGRectMake(VIEW_RIGHT(_siteImageView) + PDFSpaceSmallest,
                                            VIEW_BOTTOM(_siteNameLabel) + PDFSpaceDefault,
                                            kAddressIconViewWidth,
                                            kAddressIconViewHeight);
        
        _addressIconView.image = [UIImage imageNamed:@"PublicAddress"];
    }
    return _addressIconView;
}

- (UILabel *)siteAddressLabel {
    if (!_siteAddressLabel) {
        _siteAddressLabel = [[UILabel alloc] init];
        _siteAddressLabel.frame = CGRectMake(VIEW_RIGHT(_addressIconView) + PDFSpaceSmallest / 3,
                                             VIEW_BOTTOM(_siteNameLabel) + PDFSpaceDefault,
                                             MAIN_WIDTH - PDFSpaceSmaller - VIEW_WIDTH(_siteImageView) - PDFSpaceSmallest
                                             - kAddressIconViewWidth - PDFSpaceSmallest / 3
                                             - PDFSpaceSmaller,
                                             PDFLabelHeightBodyDefault);
        
        _siteAddressLabel.font = PDFFontDetailDefault;
        _siteAddressLabel.textColor = PDFColorTextDetailDefault;
    }
    return _siteAddressLabel;
}

- (UIButton *)reservationButton {
    if (!_reservationButton) {
        _reservationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _reservationButton.frame = CGRectMake(MAIN_WIDTH - PDFSpaceSmaller - kReservationButtonWidth,
                                              VIEW_TOP(_siteNameLabel) - 1,
                                              kReservationButtonWidth,
                                              kReservationButtonHeight);
        
        [_reservationButton setBackgroundColor:PDFColorWhite];
        [_reservationButton setTitle:@"可预定" forState:UIControlStateNormal];
        [_reservationButton setTitle:@"已订满" forState:UIControlStateSelected];
        [_reservationButton setTitleColor:PDFColorGreen forState:UIControlStateNormal];
        [_reservationButton setTitleColor:PDFColorTextDetailDefault forState:UIControlStateSelected];
        
        [_reservationButton.titleLabel setFont:PDFFontTabBarDefault];
        
        _reservationButton.clipsToBounds = YES;
        _reservationButton.layer.borderWidth = 0.5;
        _reservationButton.layer.borderColor = PDFColorGreen.CGColor;
        _reservationButton.layer.cornerRadius = 2;
    }
    return _reservationButton;
}

@end
