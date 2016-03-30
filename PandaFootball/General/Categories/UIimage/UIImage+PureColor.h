//
//  UIImage+PureColor.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/3/29.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (PureColor)

/**
 *  利用UIColor生成纯色图片
 *
 *  @param color 生成图片的颜色
 *  @param size  生成图片的尺寸
 *
 *  @return 纯色的UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
