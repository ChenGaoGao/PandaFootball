//
//  UIViewController+NavigationBar.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/3/29.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "UIViewController+NavigationBar.h"
#import "UIImage+PureColor.h"

@implementation UIViewController (NavigationBar)

#pragma mark -- setTitle
- (void)setNavigationTitleWhite:(NSString *)title{
    self.navigationItem.title = title;
    [self setNavigationTitle:title titleColor:[UIColor whiteColor]];
}

- (void)setNavigationTitleBlank:(NSString *)title{
    [self setNavigationTitle:title titleColor:XQBColorTextDeep];
}

- (void)setNavigationTitle:(NSString *)title titleColor:(UIColor *)titleColor {
    [self setNavigationTitle:title titleColor:titleColor titleFont:[UIFont boldSystemFontOfSize:18.0f]];
}

- (void)setNavigationTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont {
    self.navigationItem.title = title;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     titleColor,
                                                                     NSForegroundColorAttributeName,
                                                                     titleFont,
                                                                     NSFontAttributeName,
                                                                     nil]];
}


#pragma mark -- setNavigtionBackgroundColor
- (void)setNavigationBackgroundColor:(UIColor *)backgroundColor
                 isContentShadowLine:(BOOL)isContentShowLine{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:backgroundColor
                                                                                   size:CGSizeMake(MainWidth, STATUS_NAV_BAR_HEIGHT)]
                                                  forBarMetrics:UIBarMetricsDefault];
    
    if (isContentShowLine) {
        self.navigationController.navigationBar.shadowImage = [UIImage imageWithColor:XQBColorLineNormal
                                                                                 size:CGSizeMake(MainWidth, 0.5)];
    } else {
        self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    }
}


- (void)setNavigationBackgroundColor:(UIColor *)backgroundColor {
    [self setNavigationBackgroundColor:backgroundColor isContentShadowLine:YES];
}

- (void)setNavigationBackgroundColorGreen {
    [self setNavigationBackgroundColor:XQBColorGreen];
}

- (void)setNavigationBackgroundColorGreenWithoutLine {
    [self setNavigationBackgroundColor:XQBColorGreen isContentShadowLine:NO];
}

- (void)setNavigationBackgroundColorWhite {
    [self setNavigationBackgroundColor:[UIColor whiteColor]];
}

- (void)setNavigationBackgroundColorWhiteWithoutLine {
    [self setNavigationBackgroundColor:[UIColor whiteColor] isContentShadowLine:NO];
}


#pragma mark -- setLeftBarButton
- (void)setLeftBarButton {
    [self setLeftBarButtonItem:[self setBackBarButton] offset:-3.5];
}

- (void)setLeftBarButtonItem:(UIView *)view {
    [self setLeftBarButtonItem:view offset:-3.5];
}

- (void)setLeftBarButtonItem:(UIView *)view offset:(CGFloat)offset {
    [self setLeftBarButtonItems:@[view] offset:offset];
}

- (void)setLeftBarButtonItems:(NSArray *)views {
    [self setLeftBarButtonItems:views offset:0];
}

- (void)setLeftBarButtonItems:(NSArray *)views offset:(CGFloat)offset {
    NSMutableArray *barButtonItems = [NSMutableArray new];
    [barButtonItems addObject:[self spacer:offset]];
    
    for (UIView *view in views) {
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
        [barButtonItems addObject:barButtonItem];
    }
    
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.leftBarButtonItems = barButtonItems;
}

#pragma mark - setLeftBarButton
- (void)setRightBarButtonItem:(UIView *)view {
    [self setRightBarButtonItem:view offset:XQBSpaceMiddle];
}

- (void)setRightBarButtonItem:(UIView *)view offset:(CGFloat)offset {
    [self setRightBarButtonItems:@[view] offset:offset];
}

- (void)setRightBarButtonItems:(NSArray *)views {
    [self setRightBarButtonItems:views offset:XQBSpaceMiddle];
}

- (void)setRightBarButtonItems:(NSArray *)views offset:(CGFloat)offset{
    NSMutableArray *barButtonItems = [[NSMutableArray alloc] init];
    
    [barButtonItems addObject:[self spacer:offset]];
    
    for (UIView *view in views) {
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:view];
        [barButtonItems addObject:item];
#if !__has_feature(objc_arc)
        [item release];
#endif
    }
    
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItems = barButtonItems;
}


#pragma mark - private methods
- (UIButton *)setBackBarButton{
    UIImage *image = [UIImage imageNamed:@"xqb_navigation_back.png"];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setExclusiveTouch:YES];
    [backButton addTarget:self action:@selector(backHandle:) forControlEvents:UIControlEventTouchUpInside];
    return backButton;
}

- (void)backHandle:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIBarButtonItem *)spacer:(CGFloat)margin
{
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                           target:nil
                                                                           action:nil];
    space.width = IS5_5Inches ? margin - 20.0f : margin - 16.0f;
    return space;
}

@end
