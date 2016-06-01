//
//  MyCourseHomeCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/2.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyCourseHomeCell.h"
#import "PDFUIFormatMacros.h"


static const CGFloat kIconViewWidth             = 40.0f;
static const CGFloat kIconViewHeight            = 40.0f;

@interface MyCourseHomeCell ()

@end

@implementation MyCourseHomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        
        self.backgroundColor = PDFColorWhite;
        
        [self addSubview:self.headerIconView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.describeLabel];
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
- (UIImageView *)headerIconView {
    if (!_headerIconView) {
        _headerIconView = [[UIImageView alloc] init];
        _headerIconView.frame = CGRectMake(PDFSpaceBigger, PDFSpaceSmallish, kIconViewWidth, kIconViewHeight);
        
        _headerIconView.clipsToBounds = YES;
        _headerIconView.contentMode = UIViewContentModeScaleAspectFill;
        
        _headerIconView.layer.borderWidth = 0.5;
        _headerIconView.layer.borderColor = PDFColorLineBorder.CGColor;
        _headerIconView.layer.cornerRadius = kIconViewWidth / 2;
    }
    return _headerIconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(VIEW_RIGHT(_headerIconView) + PDFSpaceSmallest,
                                      VIEW_TOP(_headerIconView) + PDFSpaceSmaller / 2,
                                      MAIN_WIDTH - VIEW_RIGHT(_headerIconView) - PDFSpaceSmallest - PDFSpaceDefault * 2,
                                      PDFLabelHeightDetailBigger);
        
        _nameLabel.font = PDFFontDetailBigger;
        _nameLabel.textColor = PDFColorTextBodyDefault;
    }
    return _nameLabel;
}

- (UILabel *)describeLabel {
    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] init];
        _describeLabel.frame = CGRectMake(VIEW_RIGHT(_headerIconView) + PDFSpaceSmallest,
                                      VIEW_BOTTOM(_nameLabel) + PDFSpaceSmallish / 2,
                                      VIEW_WIDTH(_nameLabel),
                                      PDFLabelHeightDetailSmaller);
        
        _describeLabel.font = PDFFontDetailSmaller;
        _describeLabel.textColor = PDFColorTextDetailDefault;
    }
    return _describeLabel;
}

@end
