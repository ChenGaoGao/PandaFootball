//
//  MyCenterHeaderView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/13.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyCenterHeaderView.h"
#import "PDFUIFormatMacros.h"
#import "UIImage+PureColor.h"

static const CGFloat kLoginButtonWidth          = 80.0f;
static const CGFloat kLoginButtonHeight         = 30.0f;

@interface MyCenterHeaderView ()

@property (nonatomic, strong) UILabel *describedLabel;

@end

@implementation MyCenterHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.describedLabel];
        [self addSubview:self.loginButton];
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    self.loginButton.frame = CGRectMake((MAIN_WIDTH - WIDTH_From_4_7(kLoginButtonWidth))/ 2,
                                        VIEW_HEIGHT(self) - PDFSpaceBigger - kLoginButtonHeight,
                                        WIDTH_From_4_7(kLoginButtonWidth),
                                        kLoginButtonHeight);
    
    self.describedLabel.frame = CGRectMake(PDFSpaceDefault,
                                           (VIEW_HEIGHT(self) - PDFLabelHeightBodySmaller
                                            - VIEW_HEIGHT(self.loginButton)) * 4 / 11,
                                           MAIN_WIDTH - PDFSpaceDefault * 2,
                                           PDFLabelHeightBodySmaller);
}

#pragma mark - LazyLoad
- (UILabel *)describedLabel {
    if (!_describedLabel) {
        _describedLabel = [[UILabel alloc] init];
        
        _describedLabel.backgroundColor = [UIColor clearColor];
        _describedLabel.font = PDFFontDetailBigger;
        _describedLabel.text = @"登录一下，与熊猫足球零距离";
        _describedLabel.textColor = PDFColorWhite;
        _describedLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _describedLabel;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:PDFColorWhite forState:UIControlStateNormal];
        [_loginButton.titleLabel setFont:PDFFontBodySmaller];
        
        [_loginButton setBackgroundImage:[UIImage imageWithColor:PDFColorGreen
                                                            size:CGSizeMake(1, kLoginButtonHeight)]
                                forState:UIControlStateNormal];
        
        _loginButton.clipsToBounds = YES;
        _loginButton.layer.borderWidth = 0.5;
        _loginButton.layer.borderColor = PDFColorGreen.CGColor;
        _loginButton.layer.cornerRadius = 2;
    }
    return _loginButton;
}

@end
