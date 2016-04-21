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
static const CGFloat kCostLabelWidth        = 80.0f;
static const CGFloat kTimeIconViewWidth     = 13.0f;
static const CGFloat kTimeIconViewHeight    = 13.0f;
static const CGFloat kFightingButtonWidth   = 80.0f;
static const CGFloat kFightingButtonHeight  = 30.0f;


@interface PDFDatingFightingCell()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIImageView *timeIconView;
@property (nonatomic, strong) UIImageView *phoneIconView;
@property (nonatomic, strong) UIImageView *siteIconView;
@property (nonatomic, strong) UIImageView *addressIconView;

@end

@implementation PDFDatingFightingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        
        [self addSubview:self.iconView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.costLabel];
        [self addSubview:self.lineView];
        
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
        _iconView.frame = CGRectMake(PDFSpaceBiggest, PDFSpaceBigger, kIconViewWidth, kIconViewHeight);
        
        _iconView.clipsToBounds = YES;
        _iconView.contentMode = UIViewContentModeScaleAspectFill;
        
        _iconView.layer.borderWidth = 0.5;
        _iconView.layer.borderColor = PDFColorLineBorder.CGColor;
        _iconView.layer.cornerRadius = kIconViewHeight / 2;
    }
    return _iconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(VIEW_RIGHT(_iconView) + PDFSpaceBigger,
                                      VIEW_TOP(_iconView),
                                      MAIN_WIDTH - VIEW_RIGHT(_iconView) - PDFSpaceBigger * 2 - kCostLabelWidth - PDFSpaceDefault,
                                      VIEW_HEIGHT(_iconView));
        
        _nameLabel.font = PDFFontBodyDefault;
        _nameLabel.textColor = PDFColorTextBodyDefault;
    }
    return _nameLabel;
}

- (UILabel *)costLabel {
    if (!_costLabel) {
        _costLabel = [[UILabel alloc] init];
        _costLabel.frame = CGRectMake(MAIN_WIDTH - PDFSpaceBigger - kCostLabelWidth,
                                      VIEW_TOP(_iconView),
                                      kCostLabelWidth,
                                      VIEW_HEIGHT(_iconView));
        
        _costLabel.font = PDFFontBodyDefault;
        _costLabel.textColor = PDFColorRed;
        _costLabel.textAlignment = NSTextAlignmentRight;
    }
    return _costLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UILabel alloc] init];
        _lineView.frame = CGRectMake(PDFSpaceSmaller,
                                     VIEW_BOTTOM(_iconView) + PDFSpaceSmallest - 0.5,
                                     MAIN_WIDTH - PDFSpaceSmaller * 2,
                                     0.5);
        
        _lineView.backgroundColor = PDFColorLineSplit;
    }
    return _lineView;
}

- (UIImageView *)timeIconView {
    if (!_timeIconView) {
        _timeIconView = [[UIImageView alloc] init];
        _timeIconView.frame = CGRectMake(VIEW_LEFT(_iconView),
                                         VIEW_BOTTOM(_lineView) + PDFSpaceSmaller,
                                         kTimeIconViewWidth,
                                         kTimeIconViewHeight);
        
        _timeIconView.image = [UIImage imageNamed:@"PublicAddress"];
    }
    return _timeIconView;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.frame = CGRectMake(VIEW_RIGHT(_timeIconView) + PDFSpaceDefault,
                                      VIEW_TOP(_timeIconView),
                                      MAIN_WIDTH - VIEW_RIGHT(_timeIconView) - PDFSpaceDefault * 2 - kFightingButtonWidth - PDFSpaceBigger,
                                      VIEW_HEIGHT(_timeIconView));
        
        _timeLabel.font = PDFFontDetailDefault;
        _timeLabel.textColor = PDFColorTextDetailDefault;
    }
    return _timeLabel;
}

- (UIImageView *)phoneIconView {
    if (!_phoneIconView) {
        _phoneIconView = [[UIImageView alloc] init];
        _phoneIconView.frame = CGRectMake(VIEW_LEFT(_timeIconView),
                                          VIEW_BOTTOM(_timeIconView) + PDFSpaceSmallest,
                                          kTimeIconViewWidth,
                                          kTimeIconViewHeight);
        
        _phoneIconView.image = [UIImage imageNamed:@"PublicAddress"];
    }
    return _phoneIconView;
}

- (UILabel *)phoneLabel {
    if (!_phoneLabel) {
        _phoneLabel = [[UILabel alloc] init];
        _phoneLabel.frame = CGRectMake(VIEW_RIGHT(_phoneIconView) + PDFSpaceDefault,
                                       VIEW_TOP(_phoneIconView),
                                       MAIN_WIDTH - VIEW_RIGHT(_phoneIconView) - PDFSpaceDefault * 2 - kFightingButtonWidth - PDFSpaceBigger,
                                       VIEW_HEIGHT(_phoneIconView));
        
        _phoneLabel.font = PDFFontDetailDefault;
        _phoneLabel.textColor = PDFColorTextDetailDefault;
    }
    return _phoneLabel;
}

- (UIImageView *)siteIconView {
    if (!_siteIconView) {
        _siteIconView = [[UIImageView alloc] init];
        _siteIconView.frame = CGRectMake(VIEW_LEFT(_phoneIconView),
                                         VIEW_BOTTOM(_phoneIconView) + PDFSpaceSmallest,
                                         kTimeIconViewWidth,
                                         kTimeIconViewHeight);
        
        _siteIconView.image = [UIImage imageNamed:@"PublicAddress"];
    }
    return _siteIconView;
}

- (UILabel *)siteLabel {
    if (!_siteLabel) {
        _siteLabel = [[UILabel alloc] init];
        _siteLabel.frame = CGRectMake(VIEW_RIGHT(_siteIconView) + PDFSpaceDefault,
                                      VIEW_TOP(_siteIconView),
                                      MAIN_WIDTH - VIEW_RIGHT(_siteIconView) - PDFSpaceDefault * 2 - kFightingButtonWidth - PDFSpaceBigger,
                                      VIEW_HEIGHT(_siteIconView));
        
        _siteLabel.font = PDFFontDetailDefault;
        _siteLabel.textColor = PDFColorTextDetailDefault;
    }
    return _siteLabel;
}

- (UIImageView *)addressIconView {
    if (!_addressIconView) {
        _addressIconView = [[UIImageView alloc] init];
        _addressIconView.frame = CGRectMake(VIEW_LEFT(_siteIconView),
                                            VIEW_BOTTOM(_siteIconView) + PDFSpaceSmallest,
                                            kTimeIconViewWidth,
                                            kTimeIconViewHeight);
        
        _addressIconView.image = [UIImage imageNamed:@"PublicAddress"];
    }
    return _addressIconView;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.frame = CGRectMake(VIEW_RIGHT(_addressIconView) + PDFSpaceDefault,
                                         VIEW_TOP(_addressIconView),
                                         MAIN_WIDTH - VIEW_RIGHT(_addressIconView) - PDFSpaceBigger * 2,
                                      VIEW_HEIGHT(_addressIconView));
        
        _addressLabel.font = PDFFontDetailDefault;
        _addressLabel.textColor = PDFColorTextDetailDefault;
    }
    return _addressLabel;
}

- (UIButton *)fightingButton {
    if (!_fightingButton) {
        _fightingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _fightingButton.frame = CGRectMake(MAIN_WIDTH - PDFSpaceBigger - kFightingButtonWidth,
                                           VIEW_TOP(_timeIconView) + (VIEW_BOTTOM(_siteIconView) - VIEW_TOP(_timeIconView) - kFightingButtonHeight) / 2,
                                           kFightingButtonWidth,
                                           kFightingButtonHeight);
        
        [_fightingButton setBackgroundColor:PDFColorGreen];
        [_fightingButton setTitle:@"应战" forState:UIControlStateNormal];
        [_fightingButton setTitleColor:PDFColorWhite forState:UIControlStateNormal];
        [_fightingButton.titleLabel setFont:PDFFontDetailDefault];
        
        _fightingButton.clipsToBounds = YES;
        _fightingButton.layer.borderWidth = 0.5;
        _fightingButton.layer.borderColor = PDFColorGreen.CGColor;
        _fightingButton.layer.cornerRadius = 2;
    }
    return _fightingButton;
}

@end
