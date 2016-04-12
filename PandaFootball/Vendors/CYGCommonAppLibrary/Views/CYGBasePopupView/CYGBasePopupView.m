//
//  CYGBasePopupView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/12.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "CYGBasePopupView.h"


@interface CYGBasePopupView()

@property (nonatomic, strong) UIButton *backgroundButton;

@end

@implementation CYGBasePopupView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        
        self.directionType = PopupDirectionTypeTop;
        self.animationTime = 0.3f;
        
        [self addSubview:self.backgroundButton];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    self.backgroundButton.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

#pragma mark - PublicMethods
- (void)showInView:(UIView *)view {
    [self showInView:view animated:YES];
}

- (void)showInView:(UIView *)view animated:(BOOL)animated {
    _backgroundButton.userInteractionEnabled = YES;
    
    if (self.superview == nil) {
        [view addSubview:self];
    }
    
    if (animated) {
        //contentView动画
        [self showContentAnimationWithType:self.directionType];
        
        //背景动画
        [self showBackgroundAnimation];
    }
}

- (void)dismissView {
    [self dismissViewAnimated:YES];
}

- (void)dismissViewAnimated:(BOOL)animated {
    _backgroundButton.userInteractionEnabled = NO;
    
    if (animated) {
        //congrentView动画
        [self dismissContentAnimation:self.directionType];
        
        //背景动画
        [self dismissBackgroundAnimation];
    }
    if (!animated) {
        if ([self.delegate respondsToSelector:@selector(basePopupViewDismiss:)]) {
            [self.delegate basePopupViewDismiss:self];
        }
        
        [self removeFromSuperview];
    }
}

#pragma mark - PrivateMethods
- (void)showContentAnimationWithType:(PopupDirectionType)directionType {
    if (!self.contentView) {
        return;
    }
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.y";
    animation.additive = YES;
    animation.duration = _animationTime * 5.0 / 3.0;
    animation.keyTimes = @[ @0, @(3 / 5.0), @1 ];
    
    switch (directionType) {
        case PopupDirectionTypeTop: {
            self.contentView.frame = CGRectMake(0,
                                                0,
                                                self.contentView.frame.size.width,
                                                self.contentView.frame.size.height);
            
            animation.values = @[ @(-self.contentView.frame.size.height), @10, @0 ];
            
            break;
        } case PopupDirectionTypeBottom: {
            self.contentView.frame = CGRectMake(0,
                                                self.frame.size.height - self.contentView.frame.size.height,
                                                self.contentView.frame.size.width,
                                                self.contentView.frame.size.height);
            
            animation.values = @[ @(self.contentView.frame.size.height), @0, @0 ];
            
            break;
        } case PopupDirectionTypeCenter: {
            break;
        }
        default:
            break;
    }
    
    [self.contentView.layer addAnimation:animation forKey:@"shake"];
}

- (void)showBackgroundAnimation {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"opacity";
    animation.fromValue = @0;
    animation.toValue = @0.5;
    animation.duration = self.animationTime;
    [self.backgroundButton.layer addAnimation:animation forKey:@"opacity"];
}

- (void)dismissContentAnimation:(PopupDirectionType)directionType {
    if (!self.contentView) {
        return;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @0;
    animation.duration = self.animationTime;
    animation.additive = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    switch (directionType) {
        case PopupDirectionTypeTop: {
            animation.toValue = @(-self.contentView.frame.size.height);
            break;
        } case PopupDirectionTypeBottom: {
            animation.toValue = @(self.contentView.frame.size.height);
            break;
        } case PopupDirectionTypeCenter: {
            break;
        }
        default:
            break;
    }
    
    [self.contentView.layer addAnimation:animation forKey:@"shake"];
}

- (void)dismissBackgroundAnimation {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"opacity";
    animation.fromValue = @0.5;
    animation.toValue = @0;
    animation.duration = self.animationTime;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.delegate = self;
    [self.backgroundButton.layer addAnimation:animation forKey:@"opacity"];
}

#pragma mark - EventResponse
- (void)backgroundButtonHandle:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(basePopupView:backgroundClicked:)]) {
        [self.delegate basePopupView:self backgroundClicked:sender];
    }
    [self dismissView];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if ([self.delegate respondsToSelector:@selector(basePopupViewDismiss:)]) {
        [self.delegate basePopupViewDismiss:self];
    }
    
    if (flag) {
        [self removeFromSuperview];
    }
}

#pragma mark - LazyLoading
- (UIButton *)backgroundButton {
    if (!_backgroundButton) {
        _backgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backgroundButton.frame = CGRectMake(0, 0, 100, 100);
        _backgroundButton.alpha = 0.5;
        _backgroundButton.backgroundColor = [UIColor blackColor];
        
        [_backgroundButton addTarget:self
                              action:@selector(backgroundButtonHandle:)
                    forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _backgroundButton;
}

- (void)setContentView:(UIView *)contentView {
    _contentView = contentView;
    
    [self addSubview:contentView];
}

@end
