//
//  MyCourseScheduleTemplateCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/8.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyCourseScheduleTemplateCell.h"
#import "PDFUIFormatMacros.h"

#import "PDFSpaceView.h"

@interface MyCourseScheduleTemplateCell ()

@property (nonatomic, strong) PDFSpaceView *spaceView;

@end

@implementation MyCourseScheduleTemplateCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.spaceView];
        [self addSubview:self.iconView];
        [self addSubview:self.editButton];
        [self addSubview:self.deleteButton];
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
- (PDFSpaceView *)spaceView {
    if (_spaceView) {
        return _spaceView;
    }
    _spaceView = [[PDFSpaceView alloc] init];
    _spaceView.frame = CGRectMake(0, 0, MAIN_WIDTH, PDFSpaceSmallest);
    
    return _spaceView;
}

- (UIImageView *)iconView {
    if (_iconView) {
        return _iconView;
    }
    
    _iconView = [[UIImageView alloc] init];
    
    return _iconView;
}

@end
