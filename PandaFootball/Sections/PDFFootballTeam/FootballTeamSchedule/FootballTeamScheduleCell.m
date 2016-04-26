//
//  FootballTeamScheduleCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/21.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamScheduleCell.h"
#import "PDFPCHMacro.h"

static const CGFloat kIconViewWidth         = 32.0f;
static const CGFloat kIconViewHeight        = 32.0f;


@interface FootballTeamScheduleCell()

@end

@implementation FootballTeamScheduleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        
        [self addSubview:self.hostTeamIconView];
        [self addSubview:self.hostTeamNameLabel];
        [self addSubview:self.guestTeamIconView];
        [self addSubview:self.guestTeamNameLabel];
        
        [self addSubview:self.versusScoreLabel];
        [self addSubview:self.versusTimeLabel];
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
- (UIImageView *)hostTeamIconView {
    if (!_hostTeamIconView) {
        _hostTeamIconView = [[UIImageView alloc] init];
        _hostTeamIconView.frame = CGRectMake(PDFSpaceDefault * 2, PDFSpaceSmallish, kIconViewWidth, kIconViewHeight);
        
        _hostTeamIconView.clipsToBounds = YES;
        _hostTeamIconView.contentMode = UIViewContentModeScaleAspectFill;
        
        _hostTeamIconView.layer.borderWidth = 0.5;
        _hostTeamIconView.layer.borderColor = PDFColorLineBorder.CGColor;
        _hostTeamIconView.layer.cornerRadius = 3;
    }
    return _hostTeamIconView;
}

//- (UILabel *)hostTeamNameLabel {
//    if (!_hostTeamNameLabel) {
//        _hostTeamNameLabel = [[UILabel alloc] init];
//        _hostTeamNameLabel.frame = CGRectMake(PDFSpaceSmaller,
//                                              VIEW_BOTTOM(_hostTeamIconView) + PDFSpaceSmallest,
//                                              kIconViewWidth + PDFSpaceDefault * 2 - PDFSpaceSmaller,
//                                              <#CGFloat height#>)
//    }
//}

@end
