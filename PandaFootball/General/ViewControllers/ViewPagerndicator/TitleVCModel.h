//
//  TitleVCModel.h
//  网易首页
//
//  Created by City--Online on 15/9/1.
//  Copyright (c) 2015年 City--Online. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TitleVCModel : NSObject

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) UIViewController *viewController;

+(instancetype) createTitleVcModleWithTitle:(NSString *)title withViewController:(UIViewController *)viewController;
@end
