//
//  HomePageHeaderView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/1.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "HomePageHeaderView.h"
#import "PDFUIFormatMacros.h"

@implementation HomePageHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.backgroundColor = PDFColorGreen;
    }
    return self;
}

@end
