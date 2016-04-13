//
//  PDFSpaceView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/13.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFSpaceView.h"
#import "PDFUIFormatMacros.h"

@interface PDFSpaceView()

@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation PDFSpaceView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = PDFColorBackground;
        
        [self addSubview:self.topLineView];
        [self addSubview:self.bottomLineView];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    self.bottomLineView.frame = CGRectMake(0, VIEW_HEIGHT(self) - 0.5, MAIN_WIDTH, 0.5);
}

#pragma mark - LazyLoad
- (UIView *)topLineView {
    if (!_topLineView) {
        _topLineView = [[UIView alloc] init];
        _topLineView.frame = CGRectMake(0, 0, MAIN_WIDTH, 0.5);
        
        _topLineView.backgroundColor = PDFColorLineSplit;
    }
    return _topLineView;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.frame = CGRectMake(0, 0, MAIN_WIDTH, 0.5);
        
        _bottomLineView.backgroundColor = PDFColorLineSplit;
    }
    return _bottomLineView;
}

@end
