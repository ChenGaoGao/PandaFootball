//
//  RecruitHeaderView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/9.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "RecruitHeaderView.h"
#import "PDFUIFormatMacros.h"
#import "UIImage+PureColor.h"


static const CGFloat kButtonHeight          =  30.0f;

@interface RecruitHeaderView ()


@end

@implementation RecruitHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame dataSource:nil];
}

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSourceArray {
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSourceArray = dataSourceArray;
    }
    return self;
}

#pragma mark - Setter
- (void)setDataSourceArray:(NSArray *)dataSourceArray {
    _dataSourceArray = dataSourceArray;
    
    for (int i = 0; i < dataSourceArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(PDFSpaceDefault + (i % 4) * ((MAIN_WIDTH - PDFSpaceDefault * 2 - PDFSpaceSmallest * 3) / 4 + PDFSpaceSmallest),
                                  PDFSpaceBiggish + (i / 4) * (kButtonHeight + PDFSpaceSmaller),
                                  (MAIN_WIDTH - PDFSpaceDefault * 2 - PDFSpaceSmallest * 3) / 4,
                                  kButtonHeight);
        
        [button setTitle:[dataSourceArray objectAtIndex:i] forState:UIControlStateNormal];
        
        [button setTitleColor:PDFColorTextBodyLight forState:UIControlStateNormal];
        [button setTitleColor:PDFColorWhite forState:UIControlStateSelected];
        [button setBackgroundImage:[UIImage imageWithColor:PDFColorBackground size:button.frame.size]
                          forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageWithColor:PDFColorGreen size:button.frame.size]
                          forState:UIControlStateSelected];
        
        [button.titleLabel setFont:PDFFontDetailDefault];
        
        button.clipsToBounds = YES;
        button.layer.borderWidth = 0;
        button.layer.borderColor = PDFColorGreen.CGColor;
        button.layer.cornerRadius = 3;
        
        [self addSubview:button];
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    
    if (_selectedIndex < (int)self.dataSourceArray.count) {
        for (int i = 0; i < (int)self.dataSourceArray.count; i++) {
            UIButton *button = (UIButton *)[self.subviews objectAtIndex:i];
            
            if (i == _selectedIndex) {
                button.selected = YES;
            }
            else {
                button.selected = NO;
            }
        }
    }
}

@end
