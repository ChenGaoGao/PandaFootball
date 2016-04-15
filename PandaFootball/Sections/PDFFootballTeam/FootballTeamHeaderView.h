//
//  FootballTeamHeaderView.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/14.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FootballTeamHeaderView : UICollectionReusableView

@property (nonatomic, strong) UIImageView *headIconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *sloganLabel;                 //口号
@property (nonatomic, strong) UIButton *switchTeamButton;           //切换球队

@property (nonatomic, strong) UILabel *playersLabel;
@property (nonatomic, strong) UILabel *sitesLabel;
@property (nonatomic, strong) UILabel *resultLabel;                 //胜/负/平

@end
