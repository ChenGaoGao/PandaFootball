//
//  FootballTeamPlayerCell.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/11.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FootballTeamPlayerCell : UITableViewCell

@property (nonatomic, strong) UIView *tagView;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *siteLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UILabel *goalsScoredLabel;
@property (nonatomic, strong) UILabel *assistsScoredLabel;

@end
