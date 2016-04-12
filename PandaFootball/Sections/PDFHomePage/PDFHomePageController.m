//
//  PDFHomePageController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/11.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFHomePageController.h"
#import "CYGBasePopupView.h"

@implementation PDFHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"首页"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIView *contentView = [[UIView alloc] init];
    contentView.frame = CGRectMake(0, 0, 100, 100);
    contentView.backgroundColor = [UIColor redColor];
    
    CYGBasePopupView *popupView = [[CYGBasePopupView alloc] init];
    popupView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    popupView.contentView = contentView;
    
    [popupView showInView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
