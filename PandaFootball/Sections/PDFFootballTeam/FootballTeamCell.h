//
//  FootballTeamCell.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/14.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FBTCellLineType) {
    FBTCellLineTypeLeftBottom = 0,
    FBTCellLineTypeBottom
};

static const CGFloat kIconViewHeight        = 25.0f;

@interface FootballTeamCell : UICollectionViewCell

@property (nonatomic, assign) FBTCellLineType lineType;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;

@end
