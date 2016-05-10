//
//  FBTPostedCell.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/10.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FBTPostedCell.h"
#import "PDFUIFormatMacros.h"
#import "Masonry.h"


static const CGFloat kIconImageWidth            = 16.0f;
static const CGFloat kIconImageHeight           = 14.0f;
static const CGFloat kNameLabelHeight           = 44.0f;

@implementation FBTPostedCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        
        self.backgroundColor = PDFColorWhite;
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.iconImageView];
        [self addSubview:self.detailLabel];
        
        [self makeSubviewConstraints];
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

#pragma mark - 
- (void)makeSubviewConstraints {
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@(kNameLabelHeight));
        make.bottom.mas_equalTo(@(-PDFSpaceDefault));
        make.left.mas_equalTo(@(PDFSpaceDefault));
        make.right.mas_equalTo(@(-PDFSpaceDefault));
    }];
}

#pragma mark - LazyLoad
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(PDFSpaceDefault, 0, MAIN_WIDTH - PDFSpaceDefault * 3 - kIconImageWidth, kNameLabelHeight);
        
        _nameLabel.font = PDFFontDetailDefault;
        _nameLabel.textColor = PDFColorTextDetailDefault;
    }
    return _nameLabel;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.frame = CGRectMake(MAIN_WIDTH - PDFSpaceDefault - kIconImageWidth,
                                          (kNameLabelHeight - kIconImageHeight) / 2,
                                          kIconImageWidth, kIconImageHeight);
        
        _iconImageView.backgroundColor = PDFColorRed;
    }
    return _iconImageView;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        
        _detailLabel.font = PDFFontDetailDefault;
        _detailLabel.textColor = PDFColorTextBodyLight;
        _detailLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _detailLabel.numberOfLines = 0;
    }
    return _detailLabel;
}

@end
