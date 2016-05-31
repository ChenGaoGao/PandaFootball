//
//  MyMessageListViewController.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/31.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFBaseViewController.h"



typedef NS_ENUM(NSUInteger, MyMessageListType) {
    MyMessageListTypePlayers,           //球员比赛
    MyMessageListTypeRecruit,           //招募审核
    MyMessageListTypeSystem,            //系统消息
};

@interface MyMessageListViewController : PDFBaseViewController

@property (nonatomic, assign) MyMessageListType listType;

@end
