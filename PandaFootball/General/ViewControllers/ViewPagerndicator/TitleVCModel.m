//
//  TitleVCModel.m
//  网易首页
//
//  Created by City--Online on 15/9/1.
//  Copyright (c) 2015年 City--Online. All rights reserved.
//

#import "TitleVCModel.h"

@implementation TitleVCModel
+(instancetype) createTitleVcModleWithTitle:(NSString *)title withViewController:(UIViewController *)viewController
{
    TitleVCModel *model=[[TitleVCModel alloc]init];
    model.title=title;
    model.viewController=viewController;
    return model;
}
@end
