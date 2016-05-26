//
//  MyMessageDetailCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/25.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyMessageDetailCell.h"
#import "PDFUIFormatMacros.h"



static const CGFloat kIconViewWidth     = 18.0f;
static const CGFloat kTimeLabelWidth    = 40.0f;


@implementation MyMessageDetailCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.iconView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.detailLabel];
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
- (UIImageView *)iconView {
    if (_iconView) {
        return _iconView;
    }
    
    _iconView = [UIImageView new];
    _iconView.frame = CGRectMake(PDFSpaceDefault, PDFSpaceDefault, kIconViewWidth, kIconViewWidth);
    
    return _iconView;
}

- (UILabel *)titleLabel {
    if (_titleLabel) {
        return _titleLabel;
    }
    
    _titleLabel = [UILabel new];
    _titleLabel.frame = CGRectMake(PDFSpaceSmaller, PDFSpaceDefault, MAIN_WIDTH - VIEW_RIGHT(_iconView) - PDFSpaceSmaller, PDFLabelHeightDetailBigger);
    
    return _titleLabel;
}

@end
