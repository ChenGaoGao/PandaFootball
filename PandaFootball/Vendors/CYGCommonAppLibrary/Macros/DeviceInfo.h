//
//  DeviceInfo.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/3/29.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#ifndef DeviceInfo_h
#define DeviceInfo_h


/**
 *  System version
 */
#define SYSTEM_VERSION_FLOAT_VALUE  [[[UIDevice currentDevice] systemVersion] floatValue]
#define IS_IOS7                     (SYSTEM_VERSION_FLOAT_VALUE >= 7.0)
#define IS_IOS8                     (SYSTEM_VERSION_FLOAT_VALUE >= 8.0)
#define IS_IOS9                     (SYSTEM_VERSION_FLOAT_VALUE >= 9.0)

/**
 *  各个尺寸逻辑分辨率的宽高
 */
#define SCREEN_WIDTH_3_5            320.0f
#define SCREEN_WIDTH_4_0            320.0f
#define SCREEN_WIDTH_4_7            375.0f
#define SCREEN_WIDTH_5_5            414.0f

#define SCREEN_HEIGHT_3_5           480.0f
#define SCREEN_HEIGHT_4_0           568.0f
#define SCREEN_HEIGHT_4_7           667.0f
#define SCREEN_HEIGHT_5_5           736.0f

/**
 *  Screen size
 */
#define IS_IPAD                     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_3_5Inches                ([[UIScreen mainScreen] bounds].size.height == SCREEN_HEIGHT_3_5)
#define IS_4_0Inches                ([[UIScreen mainScreen] bounds].size.height == SCREEN_HEIGHT_4_0)
#define IS_4_7Inches                ([[UIScreen mainScreen] bounds].size.height == SCREEN_HEIGHT_4_7)
#define IS_5_5Inches                ([[UIScreen mainScreen] bounds].size.height == SCREEN_HEIGHT_5_5)

/**
 *  Screen
 */
#define SCREEN_WIDTH                [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT               [[UIScreen mainScreen] bounds].size.height
#define STATUS_BAR_HEIGHT           20.0f
#define NAVIGATIONBAR_HEIGHT        44.0f
#define TABBAR_HEIGHT               49.0f
#define STATUS_NAV_BAR_HEIGHT       (STATUS_BAR_HEIGHT + NAVIGATIONBAR_HEIGHT)
#define MAIN_HEIGHT                 (SCREEN_HEIGHT - STATUS_NAV_BAR_HEIGHT)
#define MAIN_WIDTH                  SCREEN_WIDTH

/**
 *  Screen scale
 */
//4.7寸为基准
#define WIDTH_From_4_7(width)       ((IS_3_5Inches || IS_4_0Inches) ? (width) * SCREEN_WIDTH_4_0 / SCREEN_WIDTH_4_7 : \
                                    ((IS_5_5Inches) ? (width) * SCREEN_WIDTH_5_5 / SCREEN_WIDTH_4_7 : (width)))
#define HEIGHT_From_4_7(height)     WIDTH_From_4_7(height)

/**
 *  Views
 */
#define VIEW_WIDTH(view)            view.frame.size.width
#define VIEW_HEIGHT(view)           view.frame.size.height
#define VIEW_X(view)                view.frame.origin.x
#define VIEW_Y(view)                view.frame.origin.y
#define VIEW_LEFT(view)             view.frame.origin.x
#define VIEW_TOP(view)              view.frame.origin.y
#define VIEW_BOTTOM(view)           CGRectGetMaxY(view.frame)
#define VIEW_RIGHT(view)            CGRectGetMaxX(view.frame)

#endif /* DeviceInfo_h */
