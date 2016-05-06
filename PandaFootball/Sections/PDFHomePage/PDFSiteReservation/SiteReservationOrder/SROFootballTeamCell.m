//
//  SROFootballTeamCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/6.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "SROFootballTeamCell.h"
#import "PDFUIFormatMacros.h"

static const CGFloat kIconViewWidth                 = 40.0f;

@implementation SROFootballTeamCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.headIconView];
        [self addSubview:self.nameLabel];
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

#pragma mark － LazyLoad
- (UIImageView *)headIconView {
    if (!_headIconView) {
        _headIconView = [[UIImageView alloc] init];
        _headIconView.frame = CGRectMake(PDFSpaceDefault, PDFSpaceDefault, kIconViewWidth, kIconViewWidth);
        
        _headIconView.clipsToBounds = YES;
        _headIconView.layer.borderWidth = 0.5;
        _headIconView.layer.borderColor = PDFColorGreen.CGColor;
        _headIconView.layer.cornerRadius = kIconViewWidth / 2;
    }
    return _headIconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(VIEW_RIGHT(_headIconView) + PDFSpaceDefault,
                                      PDFSpaceDefault,
                                      MAIN_WIDTH - kIconViewWidth - PDFSpaceDefault * 2,
                                      kIconViewWidth);
        
        _nameLabel.font = PDFFontDetailDefault;
        _nameLabel.textColor = PDFColorTextBodyLight;
    }
    return _nameLabel;
}

@end
