//
//  FootballTeamScheduleCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/21.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamScheduleCell.h"

static const CGFloat kIconViewWidth         = 43.0f;
static const CGFloat kIconViewHeight        = 43.0f;


@interface FootballTeamScheduleCell()

@end

@implementation FootballTeamScheduleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        
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

@end
