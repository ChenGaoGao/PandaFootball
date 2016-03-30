//
//  UIViewController+StatusBar.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/3/29.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "UIViewController+StatusBar.h"

@implementation UIViewController (StatusBar)

- (void)setStatusBarWhite {
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)setStatusBarBlank {
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

@end
