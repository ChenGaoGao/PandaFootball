//
//  UIViewController+NavigationBar.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/3/29.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#define RGB(r,g,b)      [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define NAV_TITLE_COLOR_BLANK                   RGB( 26,  26,  26)
#define NAV_BACKGROUND_COLOR_DEFAULT            RGB( 33,  33,  33)
#define NAV_SHADOW_LINE_COLOR_DEFAULT           RGB( 33,  33,  33)
#define NAV_SHADOW_LINE_COLOR_LIGHT_GRAY        RGB(214, 214, 214)//用于白色背景下面的分割线

#define NAV_LEFT_BAR_BUTTON_IMAGE               @"NavigationLeftBar.png"



#import <UIKit/UIKit.h>

@interface UIViewController (NavigationBar)

#pragma mark - setTitle
/**
 *  设置导航的title(default font blodSystem:18 textClor:white)
 *
 *  @param title 导航的文本
 */
- (void)setNavigationTitleWhite:(NSString *)title;


/**
 *  设置导航的黑色title(default font blodSystem:18 textClor:blank)
 *
 *  @param title 导航的文本
 */
- (void)setNavigationTitleBlank:(NSString *)title;

/**
 *  设置导航的title
 *
 *  @param title      导航的文本
 *  @param titleColor 导航文本的颜色
 */
- (void)setNavigationTitle:(NSString *)title titleColor:(UIColor *)titleColor;

/**
 *  设置导航的title
 *
 *  @param title      导航的文本
 *  @param titleColor 导航文本的颜色
 *  @param titleFont  导航的字体
 */
- (void)setNavigationTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont;


#pragma mark - setNavigtionBackgroundColor
/**
 *  设置导航的颜色
 *
 *  @param backgroundColor   设置导航的颜色
 *  @param isContentShowLine 是否包含下面的线
 */
- (void)setNavigationBackgroundColor:(UIColor *)backgroundColor
                 isContentShadowLine:(BOOL)isContentShowLine;

/**
 *  设置导航的颜色
 *
 *  @param backgroundColor设置导航的颜色
 */
- (void)setNavigationBackgroundColor:(UIColor *)backgroundColor;

/**
 *  设置导航的颜色(用默认宏定义里面的颜色)
 */
- (void)setNavigationBackgroundColor;

/**
 *  设置导航的颜色(用默认宏定义里面的颜色)，没有线
 */
- (void)setNavigationBackgroundColorWithoutLine;

/**
 *  设置导航的颜色为白色
 */
- (void)setNavigationBackgroundColorWhite;

/**
 *  设置导航的颜色为白色，没有线
 */
- (void)setNavigationBackgroundColorWhiteWithoutLine;


#pragma mark - setLeftBarButton
/**
 *  定义返回按钮 UIImage:NAV_LEFT_BAR_BUTTON_IMAGE size:44,44
 *
 */
- (void)setLeftBarButton;

/**
 *  设置返回按钮
 *
 *  @param view 自定的返回按钮
 */
- (void)setLeftBarButtonItem:(UIView *)view;

/**
 *  设置返回按钮
 *
 *  @param view   自定义的视图
 *  @param offset 自定义的边距
 */
- (void)setLeftBarButtonItem:(UIView *)view offset:(CGFloat)offset;

/**
 *  设置导航栏left barbutton items
 *
 *  @param views 自定义的view数组
 */
- (void)setLeftBarButtonItems:(NSArray *)views;

/**
 *  设置导航栏left barbutton items
 *
 *  @param views  自定义的view数组
 *  @param offset 自定义的边距
 */
- (void)setLeftBarButtonItems:(NSArray *)views offset:(CGFloat)offset;


#pragma mark - setLeftBarButton
/**
 *  设置导航栏的View
 *
 *  @param view 自定义的View
 */
- (void)setRightBarButtonItem:(UIView *)view;

/**
 *  设置导航右边的item
 *
 *  @param view   自定义的视图
 *  @param offset 自定义的边距
 */
- (void)setRightBarButtonItem:(UIView *)view offset:(CGFloat)offset;

/**
 *  设置导航栏右边的items
 *
 *  @param views 自定义的view数组
 */
- (void)setRightBarButtonItems:(NSArray *)views;

/**
 *  设置导航栏右边的items
 *
 *  @param views  自定义的view数组
 *  @param offset 自定义的边距
 */
- (void)setRightBarButtonItems:(NSArray *)views offset:(CGFloat)offset;

@end
