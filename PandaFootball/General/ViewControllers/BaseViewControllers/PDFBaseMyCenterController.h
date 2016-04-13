//
//  PDFBaseMyCenterController.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/13.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFBaseViewController.h"

@interface PDFBaseMyCenterController : PDFBaseViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *tableViewHeader;
@property (nonatomic, assign) CGFloat topBackgroundViewHeight;
@property (nonatomic, strong) NSURL *topBackgroundViewImageUrl;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView NS_REQUIRES_SUPER;

@end
