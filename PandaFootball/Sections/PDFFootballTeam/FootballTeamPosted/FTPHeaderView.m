//
//  FTPHeaderView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/19.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FTPHeaderView.h"

@interface FTPHeaderView()

@end

@implementation FTPHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headerIcon];
        [self addSubview:self.teamNameLabel];
        [self addSubview:self.addressLabel];
    }
    return self;
}

#pragma mark - LazyLoad
- (UIImageView *)headerIcon {
    if (!_headerIcon) {
        _headerIcon = [[UIImageView alloc] init];
    }
    return _headerIcon;
}

@end
