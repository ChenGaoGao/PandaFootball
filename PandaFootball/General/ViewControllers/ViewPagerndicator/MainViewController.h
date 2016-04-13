//
//  MainViewController.h
//  网易首页
//
//  Created by City--Online on 15/9/1.
//  Copyright (c) 2015年 City--Online. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDFBaseViewController.h"
#import "TitleVCModel.h"
#import "BottomScrollView.h"
@interface MainViewController : PDFBaseViewController
@property(nonatomic,strong) NSMutableArray *titleVcModelArray;
@property(nonatomic,strong) BottomScrollView *bottomScrollView;
-(void)initUI;
@end
