//
//  PDFPopupContentView.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/12.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFBaseViewController.h"

@class PDFPopupContentView;

@protocol PDFPopupContentViewDelegate <NSObject>

@optional
/**
 *  点击 contentview 每一个button的代理方法
 *
 *  @param contentView (self)
 *  @param index       索引值（0开始）
 */
- (void)popupContentView:(PDFPopupContentView *)contentView didSelectAtIndex:(NSInteger)index;

@end

@interface PDFPopupContentView : UIView

@property (nonatomic, strong) NSArray *dataSourceArray;
@property (nonatomic, assign) NSInteger selectedIndex;          //设置当前index值（0开始）
@property (nonatomic, strong) UIButton *bottomButton;

@property (nonatomic, weak) id <PDFPopupContentViewDelegate> delegate;

@end
