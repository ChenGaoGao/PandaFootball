
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
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.timeLabel];
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
//        _backgroundImageView.frame = CGRectMake(0, 0, <#CGFloat width#>, <#CGFloat height#>)
    }
    return _backgroundImageView;
}

- (CAGradientLayer *)bottomLayer {
    if (!_bottomLayer) {
        _bottomLayer = [CAGradientLayer new];
        _bottomLayer.frame = CGRectMake(0, VIEW_HEIGHT(_backgroundImageView) - kBottomLayerHeight, VIEW_WIDTH(_backgroundImageView), kBottomLayerHeight);
        
        _bottomLayer.startPoint = CGPointMake(0, 0);
        _bottomLayer.endPoint = CGPointMake(0, 1);
        _bottomLayer.colors = @[(__bridge id)PDFColorWhite.CGColor, (__bridge id)PDFColorBlank.CGColor];
        _bottomLayer.locations = @[@(0.0f), @(1.0f)];
    }
    return _bottomLayer;
}

@end
