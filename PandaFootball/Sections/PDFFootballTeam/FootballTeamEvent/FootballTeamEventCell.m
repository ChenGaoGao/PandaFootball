
//
//  FootballTeamEventCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/11.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamEventCell.h"
#import "PDFUIFormatMacros.h"



static const CGFloat kBackgroundViewHeight          = 185.0f;
static const CGFloat kBottomLayerHeight             = 40.0f;
static const CGFloat kTimeLabelWidth                = 85.0f;

@interface FootballTeamEventCell ()

@property (nonatomic, strong) CAGradientLayer *bottomLayer;

@end

@implementation FootballTeamEventCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = PDFColorBackground;
        
        [self addSubview:self.backgroundImageView];
        
        [self.backgroundImageView.layer addSublayer:self.bottomLayer];
        
        [self.backgroundImageView addSubview:self.titleLabel];
        [self.backgroundImageView addSubview:self.timeLabel];
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
- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.frame = CGRectMake(PDFSpaceSmallest,
                                                PDFSpaceDefault,
                                                MAIN_WIDTH - PDFSpaceSmallest * 2,
                                                HEIGHT_From_4_7(kBackgroundViewHeight));
        
        _backgroundImageView.clipsToBounds = YES;
        _backgroundImageView.layer.borderWidth = 0.5;
        _backgroundImageView.layer.borderColor = PDFColorLineBorder.CGColor;
        _backgroundImageView.layer.cornerRadius = 4.0;
    }
    return _backgroundImageView;
}

- (CAGradientLayer *)bottomLayer {
    if (!_bottomLayer) {
        _bottomLayer = [CAGradientLayer new];
        _bottomLayer.frame = CGRectMake(0, VIEW_HEIGHT(_backgroundImageView) - kBottomLayerHeight,
                                        VIEW_WIDTH(_backgroundImageView), kBottomLayerHeight);
        
        _bottomLayer.startPoint = CGPointMake(0, 0);
        _bottomLayer.endPoint = CGPointMake(0, 1);
        _bottomLayer.colors = @[(__bridge id)PDFColorWhite.CGColor, (__bridge id)PDFColorBlank.CGColor];
        _bottomLayer.locations = @[@(0.0f), @(1.0f)];
    }
    return _bottomLayer;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(PDFSpaceSmallest,
                                       VIEW_TOP(_bottomLayer),
                                       VIEW_WIDTH(_bottomLayer) - kTimeLabelWidth - PDFSpaceSmallest * 2,
                                       kBottomLayerHeight);
        
        _titleLabel.font = PDFFontDetailDefault;
        _titleLabel.textColor = PDFColorWhite;
    }
    return _titleLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.frame = CGRectMake(VIEW_RIGHT(_titleLabel),
                                      VIEW_TOP(_bottomLayer),
                                      kTimeLabelWidth,
                                      kBottomLayerHeight);
        
        _timeLabel.font = PDFFontDetailDefault;
        _timeLabel.textColor = PDFColorWhite;
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

@end
