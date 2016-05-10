//
//  RecruitTableViewCell.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/7.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecruitTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headerIconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *teamLabel;

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *addressLabel;

@end
