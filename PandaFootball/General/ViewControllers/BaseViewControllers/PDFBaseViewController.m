//
//  PDFBaseViewController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/11.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFBaseViewController.h"

@interface PDFBaseViewController ()

@end

@implementation PDFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置navigation为不透明
    self.navigationController.navigationBar.translucent = NO;
    //不要往四周边缘展开
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // NO 代表展开的时候不要包含那个导航条
    self.extendedLayoutIncludesOpaqueBars = NO;
    
    
    
    //设置状态栏
    [self setStatusBarWhite];
    
    //设置导航栏
    [self setNavigationBackgroundColorWithoutLine];
    
    //设置View背景
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
