//
//  MyCourseScheduleDayCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/2.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyCourseScheduleDayCell.h"
#import "PDFUIFormatMacros.h"



static const 

@interface MyCourseScheduleDayCell ()

@property (nonatomic, strong) UILabel *perDateLabel;
@property (nonatomic, strong) UILabel *perTotalSeeeionLabel;        //总场次
@property (nonatomic, strong) UILabel *perReserveSeeeionLabel;      //已预订

@end

@implementation MyCourseScheduleDayCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.perDateLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.perTotalSeeeionLabel];
        [self addSubview:self.totalSeeeionLabel];
        [self addSubview:self.perReserveSeeeionLabel];
        [self addSubview:self.reserveSeeeionLabel];
        [self addSubview:self.checkButton];
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


@end
