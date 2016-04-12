//
//  CYGBasePopupView.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/12.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, PopupDirectionType) {
    PopupDirectionTypeTop = 0,
    PopupDirectionTypeBottom,
    PopupDirectionTypeCenter
};


@class CYGBasePopupView;

@protocol CYGBasePopupViewDelegate <NSObject>

@optional

- (void)basePopupViewDismiss:(CYGBasePopupView *)popupView;
- (void)basePopupView:(CYGBasePopupView *)popupView backgroundClicked:(UIButton *)background;

@end



@interface CYGBasePopupView : UIView

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, assign) PopupDirectionType directionType;
@property (nonatomic, assign) CGFloat animationTime;

@property (nonatomic, weak) id <CYGBasePopupViewDelegate> delegate;

- (void)showInView:(UIView *)view;
- (void)showInView:(UIView *)view animated:(BOOL)animated;
- (void)dismissView;
- (void)dismissViewAnimated:(BOOL)animated;

@end
