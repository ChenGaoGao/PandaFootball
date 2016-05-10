//
//  RecruitHeaderView.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/9.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecruitHeaderView : UIView

@property (nonatomic, strong) NSArray <NSString *> *dataSourceArray;
@property (nonatomic, assign) NSInteger selectedIndex;

- (instancetype)initWithFrame:(CGRect)frame dataSource:(NSArray *)dataSourceArray;

@end
