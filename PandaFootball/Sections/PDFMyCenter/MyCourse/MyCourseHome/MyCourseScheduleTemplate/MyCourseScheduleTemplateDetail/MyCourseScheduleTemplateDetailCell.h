//
//  MyCourseScheduleTemplateDetailCell.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/14.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCourseScheduleTemplateDetailCell : UITableViewCell

@property (nonatomic, strong) UILabel *startTimeLabel;
@property (nonatomic, strong) UILabel *endTimeLabel;
@property (nonatomic, strong) UILabel *siteNumberLabel;         //几号场地
@property (nonatomic, strong) UILabel *headCountLabel;          //人数
@property (nonatomic, strong) UILabel *costLabel;

@property (nonatomic, strong) UIButton *editButton;
@property (nonatomic, strong) UIButton *deleteButton;

@end
