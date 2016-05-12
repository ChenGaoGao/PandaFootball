//
//  FootballTeamPlayerCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/11.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamPlayerCell.h"
#import "PDFUIFormatMacros.h"



static const CGFloat kCellBackgroundViewHeight  = 94.0f;
static const CGFloat kIconImageWidth            = 50.0f;
static const CGFloat kPerIconImageWidth         = 16.0f;
static const CGFloat kLabelWidth                = 63.0f;

@interface FootballTeamPlayerCell ()

@property (nonatomic, strong) UIView *cellBackgroundView;

@property (nonatomic, strong) UIImageView *siteImageView;
@property (nonatomic, strong) UIImageView *numberImageView;
@property (nonatomic, strong) UIImageView *goalsScoreImageView;
@property (nonatomic, strong) UIImageView *assistsScoredImageView;

@end

@implementation FootballTeamPlayerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = PDFColorBackground;
        
        [self addSubview:self.cellBackgroundView];
        
        [self.cellBackgroundView addSubview:self.tagView];
        [self.cellBackgroundView addSubview:self.iconImageView];
        [self.cellBackgroundView addSubview:self.nameLabel];
        
        [self.cellBackgroundView addSubview:self.siteImageView];
        [self.cellBackgroundView addSubview:self.siteLabel];
        [self.cellBackgroundView addSubview:self.numberImageView];
        [self.cellBackgroundView addSubview:self.numberLabel];
        [self.cellBackgroundView addSubview:self.goalsScoreImageView];
        [self.cellBackgroundView addSubview:self.goalsScoredLabel];
        [self.cellBackgroundView addSubview:self.assistsScoredImageView];
        [self.cellBackgroundView addSubview:self.assistsScoredLabel];
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
- (UIView *)cellBackgroundView {
    if (!_cellBackgroundView) {
        _cellBackgroundView = [[UIView alloc] init];
        _cellBackgroundView.frame = CGRectMake(PDFSpaceSmallest, PDFSpaceDefault,
                                               MAIN_WIDTH - PDFSpaceSmallest * 2, kCellBackgroundViewHeight);
        
        _cellBackgroundView.backgroundColor = PDFColorWhite;
        
        _cellBackgroundView.clipsToBounds = YES;
        _cellBackgroundView.layer.borderWidth = 0.5;
        _cellBackgroundView.layer.borderColor = PDFColorWhite.CGColor;
        _cellBackgroundView.layer.cornerRadius = 4;
    }
    return _cellBackgroundView;
}

- (UIView *)tagView {
    if (!_tagView) {
        _tagView = [[UIView alloc] init];
        _tagView.frame = CGRectMake(0, 0, PDFSpaceSmallest, kCellBackgroundViewHeight);
        
        _tagView.backgroundColor = PDFColorGreen;
    }
    return _tagView;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.frame = CGRectMake(VIEW_RIGHT(_tagView) + PDFSpaceBiggish, PDFSpaceSmaller,
                                          kIconImageWidth, kIconImageWidth);
        
        _iconImageView.clipsToBounds = YES;
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        
        _iconImageView.layer.borderWidth = 0.5;
        _iconImageView.layer.borderColor = PDFColorLineBorder.CGColor;
        _iconImageView.layer.cornerRadius = kIconImageWidth / 2;
    }
    return _iconImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(VIEW_LEFT(_iconImageView) - PDFSpaceSmallest,
                                      VIEW_BOTTOM(_iconImageView) + PDFSpaceSmallest,
                                      VIEW_WIDTH(_iconImageView) + PDFSpaceSmallest * 2,
                                      PDFLabelHeightDetailSmaller);
        
        _nameLabel.font = PDFFontDetailSmaller;
        _nameLabel.textColor = PDFColorTextBodyLight;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}

- (UIImageView *)siteImageView {
    if (!_siteImageView) {
        _siteImageView = [[UIImageView alloc] init];
        _siteImageView.frame = CGRectMake(VIEW_RIGHT(_iconImageView) + PDFSpaceBiggish +
                                          (MAIN_WIDTH - (VIEW_RIGHT(_iconImageView) + PDFSpaceBiggish +
                                                         (kPerIconImageWidth + PDFSpaceSmallest + kLabelWidth) * 2 +
                                                         PDFSpaceSmallest * 3)) / 2 ,
                                          23.5,
                                          kPerIconImageWidth,
                                          kPerIconImageWidth);
        
        _siteImageView.image = [UIImage imageNamed:@"DatingFightingGray"];
    }
    return _siteImageView;
}

- (UILabel *)siteLabel {
    if (!_siteLabel) {
        _siteLabel = [[UILabel alloc] init];
        _siteLabel.frame = CGRectMake(VIEW_RIGHT(_siteImageView) + PDFSpaceSmallest,
                                      VIEW_TOP(_siteImageView),
                                      kLabelWidth,
                                      VIEW_HEIGHT(_siteImageView));
        
        _siteLabel.font = PDFFontDetailSmaller;
        _siteLabel.textColor = PDFColorTextBodyLight;
    }
    return _siteLabel;
}

- (UIImageView *)numberImageView {
    if (!_numberImageView) {
        _numberImageView = [[UIImageView alloc] init];
        _numberImageView.frame = CGRectMake(VIEW_RIGHT(_siteLabel) +
                                            (MAIN_WIDTH - (VIEW_RIGHT(_iconImageView) + PDFSpaceBiggish +
                                                           (kPerIconImageWidth + PDFSpaceSmallest + kLabelWidth) * 2 +
                                                           PDFSpaceSmallest * 3)) / 2 ,
                                          VIEW_TOP(_siteImageView),
                                          kPerIconImageWidth,
                                          kPerIconImageWidth);
        
        _numberImageView.image = [UIImage imageNamed:@"DatingFightingGray"];
    }
    return _numberImageView;
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.frame = CGRectMake(VIEW_RIGHT(_numberImageView) + PDFSpaceSmallest,
                                        VIEW_TOP(_numberImageView),
                                        kLabelWidth,
                                        VIEW_HEIGHT(_numberImageView));
        
        _numberLabel.font = PDFFontDetailSmaller;
        _numberLabel.textColor = PDFColorTextBodyLight;
    }
    return _numberLabel;
}

- (UIImageView *)goalsScoreImageView {
    if (!_goalsScoreImageView) {
        _goalsScoreImageView = [[UIImageView alloc] init];
        _goalsScoreImageView.frame = CGRectMake(VIEW_LEFT(_siteImageView),
                                                VIEW_BOTTOM(_siteImageView) + PDFSpaceDefault,
                                                kPerIconImageWidth, kPerIconImageWidth);
        
        _goalsScoreImageView.image = [UIImage imageNamed:@"DatingFightingGray"];
    }
    return _goalsScoreImageView;
}

- (UILabel *)goalsScoredLabel {
    if (!_goalsScoredLabel) {
        _goalsScoredLabel = [[UILabel alloc] init];
        _goalsScoredLabel.frame = CGRectMake(VIEW_RIGHT(_goalsScoreImageView) + PDFSpaceSmallest,
                                             VIEW_TOP(_goalsScoreImageView),
                                             kLabelWidth,
                                             VIEW_HEIGHT(_goalsScoreImageView));
        
        _goalsScoredLabel.font = PDFFontDetailSmaller;
        _goalsScoredLabel.textColor = PDFColorTextBodyLight;
    }
    return _goalsScoredLabel;
}

- (UIImageView *)assistsScoredImageView {
    if (!_assistsScoredImageView) {
        _assistsScoredImageView = [[UIImageView alloc] init];
        _assistsScoredImageView.frame = CGRectMake(VIEW_LEFT(_numberImageView),
                                                   VIEW_BOTTOM(_siteImageView) + PDFSpaceDefault,
                                                   kPerIconImageWidth, kPerIconImageWidth);
        
        _assistsScoredImageView.image = [UIImage imageNamed:@"DatingFightingGray"];
    }
    return _assistsScoredImageView;
}

- (UILabel *)assistsScoredLabel {
    if (!_assistsScoredLabel) {
        _assistsScoredLabel = [[UILabel alloc] init];
        _assistsScoredLabel.frame = CGRectMake(VIEW_RIGHT(_assistsScoredImageView) + PDFSpaceSmallest,
                                               VIEW_TOP(_assistsScoredImageView),
                                               kLabelWidth,
                                               VIEW_HEIGHT(_assistsScoredImageView));
        
        _assistsScoredLabel.font = PDFFontDetailSmaller;
        _assistsScoredLabel.textColor = PDFColorTextBodyLight;
    }
    return _assistsScoredLabel;
}

@end
