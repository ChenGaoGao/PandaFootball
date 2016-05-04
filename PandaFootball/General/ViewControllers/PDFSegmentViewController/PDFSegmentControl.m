//
//  PDFSegmentControl.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/28.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFSegmentControl.h"
#import "PDFUIFormatMacros.h"
#import <libkern/OSAtomic.h>

@interface PDFSegmentControl()

@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation PDFSegmentControl

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = PDFColorWhite;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
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
    
    self.bottomLineView.frame = CGRectMake(0, VIEW_HEIGHT(self) - 0.5,
                                           MAX(VIEW_WIDTH(self), titleArray.count * segmentButtonWidth), 0.5);
    
    self.contentSize = CGSizeMake(titleArray.count * segmentButtonWidth, VIEW_HEIGHT(self));
    
    [self addSubview:self.bottomLineView];
    [self addSubview:self.markView];
}

#pragma mark - Event
- (void)segmentButtonHandle:(UIButton *)sender {
    self.selectedIndex = sender.tag;
}

#pragma mark - Animation
- (void)markViewAnimationFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @(VIEW_WIDTH(self.markView) * fromIndex + VIEW_WIDTH(self.markView) /2);
    animation.toValue = @(VIEW_WIDTH(self.markView) * toIndex + VIEW_WIDTH(self.markView) / 2);
    animation.duration = 0.3;
    
    [self.markView.layer addAnimation:animation forKey:@"abc"];
    
    self.markView.frame = CGRectMake(VIEW_WIDTH(self.markView) * toIndex, VIEW_HEIGHT(self) - 2, VIEW_WIDTH(self.markView), 2);
}

- (void)contentOffsetAnimationFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    if (self.contentSize.width <= VIEW_WIDTH(self)) {
        return;
    }
    
    CGFloat animtionWidth = (self.contentSize.width - VIEW_WIDTH(self)) / (self.titleArray.count - 1);
//    self.contentOffset = CGPointMake(animtionWidth / (self.titleArray.count - 1) * toIndex, 0);

    
    
    __block CGFloat sourceOffsetX = self.contentOffset.x;
    __block CGFloat currentOffsetx = sourceOffsetX;
    
    NSTimeInterval period = 0.3; //设置时间间隔
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, period * NSEC_PER_MSEC, 0); //每秒执行
    dispatch_source_set_event_handler(timer, ^{
        currentOffsetx = currentOffsetx + animtionWidth * (toIndex - fromIndex) / 0.3;
        
        NSLog(@"ssss%f     ssss%f", self.contentOffset.x, animtionWidth);
        if (fabs(currentOffsetx - sourceOffsetX) >= fabs(animtionWidth * (toIndex - fromIndex))) {
            //必须要有退出方法，不然eventHandler是不会执行的
            dispatch_source_cancel(timer);
        }
        
        //通知主线程刷新
        dispatch_async(dispatch_get_main_queue(), ^{
            self.contentOffset = CGPointMake(currentOffsetx, 0);
        });
    });
    
//    dispatch_source_set_cancel_handler(timer, ^{
//        NSLog(@"timersource cancel handle block");
//    });
    
    dispatch_resume(timer);
}

//- (void)segmentButtonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
//    if (_selectedIndex < (int)self.titleArray.count) {
//        for (int i = 0; i < (int)self.titleArray.count; i++) {
//            if (i == fromIndex) {
//                CABasicAnimation *animation = [CABasicAnimation animation];
//                animation.keyPath = @"backgroundcolor";
//                animation.fromValue = self.titleColor;
//                animation.toValue = self.titlehighlightedColor;
//                animation.duration = 0.3;
//                animation.additive = YES;
//                animation.fillMode = kCAFillModeForwards;
//                animation.removedOnCompletion = NO;
//                
//                UIButton *button = (UIButton *)[self.subviews objectAtIndex:i];
//                [button.titleLabel.textColor layer addAnimation:animation forKey:@"backgroundcolor"];
//            }
//            
////            if (i == toIndex) {
////                UIButton *button = (UIButton *)[self.subviews objectAtIndex:i];
////                [button setTitleColor:self.titlehighlightedColor forState:UIControlStateNormal];
////            }
//        }
//    }
//}



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
    [self markViewAnimationFromIndex:_selectedIndex toIndex:selectedIndex];
    [self contentOffsetAnimationFromIndex:_selectedIndex toIndex:selectedIndex];
    
    _selectedIndex = selectedIndex;

    if (_selectedIndex < (int)self.titleArray.count) {
        for (int i = 0; i < (int)self.titleArray.count; i++) {
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
