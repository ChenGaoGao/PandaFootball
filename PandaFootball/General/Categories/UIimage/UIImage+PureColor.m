//
//  UIImage+PureColor.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/3/29.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "UIImage+PureColor.h"

@implementation UIImage (PureColor)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
