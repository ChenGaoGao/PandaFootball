//
//  PDFSegmentControl.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/28.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDFSegmentModel.h"



@class PDFSegmentControl;

@protocol PDFSegmentControlDelegate <NSObject>

@optional
- (void)segmentControl:(PDFSegmentControl *)contentView didSelectAtIndex:(NSInteger)index;

@end


@interface PDFSegmentControl : UIScrollView

@property (nonatomic, copy) NSArray<PDFSegmentModel *> *titleArray;
@property (nonatomic, strong) UIView *markView;

@property (nonatomic, weak) id <PDFSegmentControlDelegate> m_delegate;

//titleButton的宽度（默认值: titleArray.count > 4 ? 屏幕宽度／titleArray.count : 屏幕宽度/4）
@property (nonatomic, assign) CGFloat titleButtonWidth;
//titleButton的字体大小（默认值: 15）
@property (nonatomic, strong) UIFont *titleFont;
//titleButton的字体颜色（默认值: PDFColorTextDetailDefault）
@property (nonatomic, strong) UIColor *titleColor;
//titleButton的高亮字体颜色（默认值: PDFColorGreen）
@property (nonatomic, strong) UIColor *titlehighlightedColor;
//markView的颜色（默认值: PDFColorGreen）
@property (nonatomic, strong) UIColor *markColor;
//选中索引
@property (nonatomic, assign) NSInteger selectedIndex;

//竖直方向是否有分割线
@property (nonatomic, assign) BOOL hadSeparatorLine;

@end
