//
//  PDFSegmentControl.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/28.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFSegmentControl.h"
#import "PDFUIFormatMacros.h"

@interface PDFSegmentControl()

@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation PDFSegmentControl

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = PDFColorWhite;
        
        self.titleFont = PDFFontBodySmaller;
        self.titleColor = PDFColorTextDetailDefault;
        self.titlehighlightedColor = PDFColorGreen;
        self.markColor = PDFColorGreen;
        
        self.hadSeparatorLine = NO;
        
        [self addSubview:self.bottomLineView];
    }
    return self;
}

#pragma mark - Method
- (void)createTitleButtonsWithTitleArray:(NSArray<PDFSegmentModel *> *)titleArray {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    CGFloat segmentButtonWidth = 0;
    
    if (titleArray.count > 4) {
        segmentButtonWidth = VIEW_WIDTH(self) / 4;
    }
    if (titleArray.count <= 4) {
        segmentButtonWidth = VIEW_WIDTH(self) / titleArray.count;
    }
    
    
    for (int i = 0; i < titleArray.count; i++) {
        PDFSegmentModel *segmentModel = [titleArray objectAtIndex:i];
        
        UIButton *segmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        segmentButton.frame = CGRectMake(segmentButtonWidth * i, 0, segmentButtonWidth, VIEW_HEIGHT(self));
        
        [segmentButton.titleLabel setFont:self.titleFont];
        
        [segmentButton setTitle:segmentModel.title forState:UIControlStateNormal];
        [segmentButton setTitleColor:self.titleColor forState:UIControlStateNormal];
        [segmentButton setTitleColor:self.titlehighlightedColor forState:UIControlStateSelected];
        
        if (segmentModel.icon) {
            [segmentButton setImage:segmentModel.icon forState:UIControlStateNormal];
            [segmentButton setImage:segmentModel.icon forState:UIControlStateHighlighted];
        }
        if (segmentModel.highlightedIcon) {
            [segmentButton setImage:segmentModel.highlightedIcon forState:UIControlStateSelected];
        }
        
        [segmentButton setTag:i];
        [segmentButton addTarget:self
                          action:@selector(segmentButtonHandle:)
                forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:segmentButton];
    }
    
    self.selectedIndex = 0;
    
    self.markView.frame = CGRectMake(0, VIEW_HEIGHT(self) - 2, segmentButtonWidth, 2);
    
    self.bottomLineView.frame = CGRectMake(0, VIEW_HEIGHT(self) - 0.5, VIEW_WIDTH(self), 0.5);
    
    [self addSubview:self.bottomLineView];
    [self addSubview:self.markView];
}

#pragma mark - Event
- (void)segmentButtonHandle:(UIButton *)sender {
    self.selectedIndex = sender.tag;
}

#pragma mark - Setters
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    _bottomLineView.frame = CGRectMake(0, frame.size.height - 0.5, frame.size.width, 0.5);
    
    if (self.titleArray.count == 0) {
        //有可能 setTitleArray 在 setframe 后才调用，self 没有 titleArray
        //需要等到设置好 titleArray 后才能创建 titleButton；
        return;
    }
    
    //有可能 setframe 在 setTitleArray 后调用，self 就有 frame 和 titleArray 了，就可以直接创建titleButtons
    
    //或者 设置好 titleArray 和 frame 后，重新设置 frame 时也要重新设置 titleButtons
    [self createTitleButtonsWithTitleArray:self.titleArray];
}

- (void)setTitleArray:(NSArray<PDFSegmentModel *> *)titleArray {
    _titleArray = titleArray;
    
    if (self.frame.size.height == 0) {
        //有可能 setframe 在 setTitleArray 后才调用，self 就没有 frame
        //需要等到设置好 frame 后才能创建 titleButtons；
        return;
    }
    
    //有可能 setTitleArray 在 setframe 后调用，self 就有 frame 和 titleArray 了，就可以直接创建titleButton
    [self createTitleButtonsWithTitleArray:_titleArray];
}

//- (void)setTitleButtonWidth:(CGFloat)titleButtonWidth {
//    
//}
//
//- (void)setTitleFont:(UIFont *)titleFont {
//    
//}
//
//- (void)setTitleColor:(UIColor *)titleColor {
//    
//}
//
//- (void)setTitlehighlightedColor:(UIColor *)titlehighlightedColor {
//    
//}
//
//- (void)setMarkColor:(UIColor *)markColor {
//    
//}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    
    if (_selectedIndex < (int)self.titleArray.count) {
        for (int i = 0; i < (int)self.titleArray.count; i++) {
            UIButton *button = (UIButton *)[self.subviews objectAtIndex:i];
            
            NSLog(@"%d", i);
            
            if (i == _selectedIndex) {
                button.selected = YES;
            }
            else {
                button.selected = NO;
            }
        }
    }
}

//- (void)setHadSeparatorLine:(BOOL)hadSeparatorLine {
//    
//}

#pragma mark - LazyLoad
- (UIView *)markView {
    if (!_markView) {
        _markView = [[UIView alloc] init];
        
        _markView.backgroundColor = self.markColor;
    }
    return _markView;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        
        _bottomLineView.backgroundColor = PDFColorLineSplit;
    }
    return _bottomLineView;
}

@end
