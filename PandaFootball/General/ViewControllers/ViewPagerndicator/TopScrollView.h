//
//  TopScrollView.h
//  网易首页
//
//  Created by City--Online on 15/9/1.
//  Copyright (c) 2015年 City--Online. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "Global.h"

#define kWidthForLeft 0
#define kWidthForRight 0
#define kTopButtonFont 15.0
#define kButtonTagStart 1000
#define kJIAN_GE_HEIGHT SCREEN_WIDTH / 2

@protocol TopScrollViewDelegate <NSObject>
@optional
-(void)barSelectedIndexChanged:(int)newIndex;
@end

@interface TopScrollView : UIScrollView
@property (nonatomic, assign) int            selectedIndex; // 选中的页数
@property (nonatomic, strong) NSMutableArray *buttonArray;  // 存放所有的标题的点击按钮


@property (nonatomic, unsafe_unretained) id<TopScrollViewDelegate>topViewDelegate;

/**
 *  初始化TopBar
 *
 *  @param frame      TopBar的frame
 *  @param titleArray 存放标题的数组
 *
 * */

-(id)initWithFrame:(CGRect)frame andItems:(NSArray*)titleArray;
//-(void)setLineOffsetWithPage:(float)page andRatio:(float)ratio;
-(void)selectIndex:(int)index withFlag:(BOOL)flag;
-(void)onClick:(id)sender;
@end
