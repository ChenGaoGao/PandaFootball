//
//  PDFDatingFightingCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/14.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFDatingFightingCell.h"
#import "PDFUIFormatMacros.h"

static const CGFloat kIconViewWidth         = 43.0f;
static const CGFloat kIconViewHeight        = 43.0f;

@interface PDFDatingFightingCell()

@property (nonatomic, strong) UIImageView *timeIconView;
@property (nonatomic, strong) UIImageView *phoneIconView;
@property (nonatomic, strong) UIImageView *siteIconView;
@property (nonatomic, strong) UIImageView *addressIconView;

@end

@implementation PDFDatingFightingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.iconView];
        [self addSubview:self.costLabel];
        
        [self addSubview:self.timeIconView];
        [self addSubview:self.timeLabel];
        [self addSubview:self.phoneIconView];
        [self addSubview:self.phoneLabel];
        [self addSubview:self.siteIconView];
        [self addSubview:self.siteLabel];
        [self addSubview:self.addressIconView];
        [self addSubview:self.addressLabel];
        
        [self addSubview:self.fightingButton];
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

#pragma mark - LazyLoad
- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.frame = CGRectMake(PDFSpaceBiggest, PDFSpaceSmallish, kIconViewWidth, kIconViewHeight);
        
        _iconView.clipsToBounds = YES;
        _iconView.layer.borderWidth = 0.5;
        _iconView.layer.borderColor = PDFColorBorderLine.CGColor;
        _iconView.layer.cornerRadius = kIconViewHeight / 2;
    }
    return _iconView;
}

@end
