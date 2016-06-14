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


const static CGFloat kIconViewHeight            = 15.0f;
const static CGFloat kButtonWidth               = 36.0f;
const static CGFloat kButtonHeight              = 49.0f;

@interface MyCourseScheduleTemplateCell ()

@property (nonatomic, strong) PDFSpaceView *spaceView;

@end

@implementation MyCourseScheduleTemplateCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.spaceView];
        [self addSubview:self.iconView];
        [self addSubview:self.titleLabel];
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
    _iconView.frame = CGRectMake(PDFSpaceBigger, VIEW_BOTTOM(_spaceView) + PDFSpaceBiggish, kIconViewHeight, kIconViewHeight);
    
    _iconView.backgroundColor = PDFColorRed;
    
    return _iconView;
}

- (UILabel *)titleLabel {
    if (_titleLabel) {
        return _titleLabel;
    }
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.frame = CGRectMake(VIEW_RIGHT(_iconView) + PDFSpaceSmallest,
                                   VIEW_BOTTOM(_spaceView),
                                   MAIN_WIDTH - (VIEW_RIGHT(_iconView) + PDFSpaceSmallest)
                                   - (kButtonWidth * 2 + PDFSpaceSmallest),
                                   kButtonHeight);
    
    _titleLabel.font = PDFFontBodySmaller;
    _titleLabel.textColor = PDFColorTextBodyLight;
    
    return _titleLabel;
}

- (UIButton *)editButton {
    if (_editButton) {
        return _editButton;
    }
    _editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _editButton.frame = CGRectMake(VIEW_RIGHT(_titleLabel), VIEW_BOTTOM(_spaceView), kButtonWidth, kButtonHeight);
    
    _editButton.backgroundColor = PDFColorRed;
    
    return _editButton;
}

- (UIButton *)deleteButton {
    if (_deleteButton) {
        return _deleteButton;
    }
    _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleteButton.frame = CGRectMake(VIEW_RIGHT(_editButton), VIEW_BOTTOM(_spaceView), kButtonWidth, kButtonHeight);
    
    _deleteButton.backgroundColor = PDFColorGreen;
    
    return _deleteButton;
}

@end
