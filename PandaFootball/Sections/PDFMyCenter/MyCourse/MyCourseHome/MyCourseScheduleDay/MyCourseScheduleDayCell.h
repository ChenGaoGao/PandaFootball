//
//  MyCourseScheduleDayCell.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/2.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCourseScheduleDayCell : UITableViewCell

@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *totalSeeeionLabel;       //总场次
@property (nonatomic, strong) UILabel *reserveSeeeionLabel;     //已预订
@property (nonatomic, strong) UIButton *checkButton;

@end
