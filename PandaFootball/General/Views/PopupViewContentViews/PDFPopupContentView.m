//
//  PDFPopupContentView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/12.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFPopupContentView.h"
#import "PDFUIFormatMacros.h"
#import "UIImage+PureColor.h"

static const CGFloat kButtonHeight                      = 36.0f;

@interface PDFPopupContentView()

@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) UIButton *bottomButtonDefault;

@end

@implementation PDFPopupContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = PDFColorWhite;
        
        self.bottomButton = self.bottomButtonDefault;
    }
    return self;
}

#pragma mark - 
- (void)resetFrame {
    self.frame = CGRectMake(VIEW_X(self), VIEW_Y(self), VIEW_WIDTH(self),
                            PDFSpaceBigger +
                            (_dataSourceArray.count / 3 + 1) * (kButtonHeight + PDFSpaceDefault) +
                            PDFSpaceBigger - PDFSpaceDefault +
                            VIEW_HEIGHT(self.bottomButton)
                            );
    
    self.bottomButton.frame = CGRectMake(VIEW_X(self.bottomButton),
                                         VIEW_HEIGHT(self) - VIEW_HEIGHT(self.bottomButton),
                                         VIEW_WIDTH(self.bottomButton),
                                         VIEW_HEIGHT(self.bottomButton));
    
    self.bottomLineView.frame = CGRectMake(VIEW_X(self.bottomLineView),
                                           VIEW_HEIGHT(self) - VIEW_HEIGHT(self.bottomButton),
                                           VIEW_WIDTH(self.bottomLineView),
                                           VIEW_HEIGHT(self.bottomLineView));
}

#pragma mark - EventResponse
- (void)buttonHandel:(UIButton *)sender {
    self.selectedIndex = sender.tag;
    
    if ([self.delegate respondsToSelector:@selector(popupContentView:didSelectAtIndex:)]) {
        [self.delegate popupContentView:self didSelectAtIndex:sender.tag];
    }
}

- (void)buttonDefaultHandle:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(popupContentView:bottomButtonDefaultClicked:)]) {
        [self.delegate popupContentView:self bottomButtonDefaultClicked:sender];
    }
}

#pragma mark - Setters
- (void)setDataSourceArray:(NSMutableArray *)dataSourceArray {
    _dataSourceArray = dataSourceArray;
    
    [self resetFrame];
    
    for (int i = 0; i < _dataSourceArray.count; i++) {
        NSString *titleString = [_dataSourceArray objectAtIndex:i];
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(PDFSpaceBiggish + (i % 3) * (MAIN_WIDTH - PDFSpaceBiggish) / 3,
                                  PDFSpaceBigger + (i / 3) * (kButtonHeight + PDFSpaceDefault),
                                  (MAIN_WIDTH - PDFSpaceBiggish) / 3 - PDFSpaceBiggish,
                                  kButtonHeight);
        [button setTitle:titleString forState:UIControlStateNormal];
        [button setTitleColor:PDFColorTextDetailMoreDeep forState:UIControlStateNormal];
        [button.titleLabel setFont:PDFFontDetailDefault];
        
        [button setBackgroundImage:[UIImage imageWithColor:PDFColorWhite
                                                      size:CGSizeMake(1, kButtonHeight)]
                          forState:UIControlStateNormal];
        
        [button setBackgroundImage:[UIImage imageWithColor:PDFColorBackground
                                                      size:CGSizeMake(1, kButtonHeight)]
                          forState:UIControlStateSelected];
        
        [button setTag:i];
        [button addTarget:self action:@selector(buttonHandel:) forControlEvents:UIControlEventTouchUpInside];
        
        button.clipsToBounds = YES;
        button.layer.borderWidth = 0.5;
        button.layer.borderColor = PDFColorBorderLine.CGColor;
        button.layer.cornerRadius = kButtonHeight / 2;
        
        [self addSubview:button];
    }
    
    //保证 bottomButton 是 self 的倒数第二个子view
    //bottomLineView 是最后一个
    //从而让上面的 button 的顺序与selectedIndex值一样
    [_bottomButton removeFromSuperview];
    [self.bottomLineView removeFromSuperview];
    
    [self addSubview:_bottomButton];
    [self addSubview:self.bottomLineView];
    
    self.selectedIndex = 0;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    
    if (_selectedIndex < (int)self.subviews.count - 2) { //contentView 还有bottomButton子view
        for (int i = 0; i < (int)self.subviews.count - 2; i++) {
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

- (void)setBottomButton:(UIButton *)bottomButton {
    [_bottomButton removeFromSuperview];
    [self.bottomLineView removeFromSuperview];
    
    _bottomButton = bottomButton;
    
    [self addSubview:_bottomButton];
    [self addSubview:self.bottomLineView];
    
    [self resetFrame];
}

#pragma mark - LazyLoad
- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.frame = CGRectMake(0, 0, MAIN_WIDTH, 0.5);
        
        _bottomLineView.backgroundColor = PDFColorLineSplit;
    }
    return _bottomLineView;
}

- (UIButton *)bottomButtonDefault {
    if (!_bottomButtonDefault) {
        _bottomButtonDefault = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomButtonDefault.frame = CGRectMake(0, 0, MAIN_WIDTH, kBottomButtonDefaultHeight);
        [_bottomButtonDefault setImage:[UIImage imageNamed:@"PopupViewSwitch.png"] forState:UIControlStateNormal];
        
        [_bottomButtonDefault addTarget:self
                                 action:@selector(buttonDefaultHandle:)
                       forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomButtonDefault;
}

@end
