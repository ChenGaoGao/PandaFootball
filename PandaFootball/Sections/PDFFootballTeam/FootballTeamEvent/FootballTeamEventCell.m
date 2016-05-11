
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
    }
    return _backgroundImageView;
}

@end
