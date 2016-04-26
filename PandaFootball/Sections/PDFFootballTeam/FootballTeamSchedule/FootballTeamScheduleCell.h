//
//  FootballTeamScheduleCell.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/21.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, FBTSCVersusState) {
    FBTSCVersusStateUnfinished = 0,
    FBTSCVersusStateFinished,
};


@interface FootballTeamScheduleCell : UITableViewCell

@property (nonatomic, strong) UIImageView *hostTeamIconView;
@property (nonatomic, strong) UILabel *hostTeamNameLabel;
@property (nonatomic, strong) UIImageView *guestTeamIconView;
@property (nonatomic, strong) UILabel *guestTeamNameLabel;

@property (nonatomic, assign) FBTSCVersusState versusState;
@property (nonatomic, strong) UILabel *versusScoreLabel;
@property (nonatomic, strong) UILabel *versusTimeLabel;


@end
