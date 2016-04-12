//
//  PDFUIFormatMacros.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/11.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#ifndef PDFUIFormatMacros_h
#define PDFUIFormatMacros_h

#import "DeviceInfo.h"

/**
 *  Color
 */
//16进制的时候用
#define UIColorFromRGB(rgbValue)    [UIColor \
                                        colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                        green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                        blue: ((float)(rgbValue & 0xFF))/255.0 \
                                        alpha:1.0]

#define RGB(r,g,b)                  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBA(r,g,b,a)               [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

//通用颜色
#define PDFColorGreen               RGB( 76, 176,  80)
#define PDFColorWhite               RGB(255, 255, 255)
#define PDFColorBackground          RGB(245, 245, 245)

//文字颜色
#define PDFColorTextBodyDefault     RGB( 36,  36,  36)      //body表示正文
#define PDFColorTextBodyDeep        RGB( 26,  26,  26)
#define PDFColorTextBodyLight       RGB( 51,  51,  51)

#define PDFColorTextDetailDefault   RGB(128, 128, 128)      //detail表示描述信息
#define PDFColorTextDetailDeep      RGB(102, 102, 102)
#define PDFColorTextDetailMoreDeep  RGB( 76,  76,  76)

#define PDFColorTextTabBarDefault   RGB(184, 184, 184)
#define PDFColorTextTabBarGreen     PDFColorGreen

//分割线颜色
#define PDFColorLineSplit           RGB(224, 224, 224)
#define PDFColorLineTabBar          RGB(178, 178, 178)


/**
 *  Font
 */
#define PDFFontBodyDefault          [UIFont systemFontOfSize:16.0f]
#define PDFFontBodyBiggest          [UIFont systemFontOfSize:18.0f]
#define PDFFontBodyBigger           [UIFont systemFontOfSize:17.0f]
#define PDFFontBodySmaller          [UIFont systemFontOfSize:15.0f]

#define PDFFontDetailDefault        [UIFont systemFontOfSize:13.0f]
#define PDFFontDetailBigger         [UIFont systemFontOfSize:14.0f]
#define PDFFontDetailSmaller        [UIFont systemFontOfSize:12.0f]

#define PDFFontTabBarDefault        [UIFont systemFontOfSize:11.0f]




/**
 *  Label Height
 *  (与字体大小对应)
 */
#define PDFLabelHeightBodyDefault   (16.0f)
#define PDFLabelHeightBodyBiggest   (18.0f)
#define PDFLabelHeightBodyBigger    (17.0f)
#define PDFLabelHeightBodySmaller   (15.0f)

#define PDFLabelHeightDetailDefault (13.0f)
#define PDFLabelHeightDetailBigger  (14.0f)
#define PDFLabelHeightDetailSmaller (12.0f)



/**
 *  Space
 *  (间隙)
 */
#define PDFSpaceDefault             (12.0f)
#define PDFSpaceDiggest             (20.0f)
#define PDFSpaceDigger              (16.0f)
#define PDFSpaceSmaller             (10.0f)
#define PDFSpaceSmallest            (8.0f)



/**
 *  通用控件大小
 */
#define PDFNavagationBarWidth       (44.0f)
#define PDFNavagationBarHeight      (44.0f)


#endif /* PDFUIFormatMacros_h */
