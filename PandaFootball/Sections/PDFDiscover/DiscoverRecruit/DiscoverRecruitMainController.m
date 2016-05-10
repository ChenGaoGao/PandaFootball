//
//  DiscoverRecruitMainController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/7.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "DiscoverRecruitMainController.h"
#import "DiscoverRecruitViewController.h"

@interface DiscoverRecruitMainController ()

@end

@implementation DiscoverRecruitMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"招募"];
    [self setLeftBarButton];
    
    NSMutableArray *titleVCModelArray = [[NSMutableArray alloc] init];
    
    //订场
    PDFSegmentModel *teamSegmentModel = [[PDFSegmentModel alloc] init];
    teamSegmentModel.title = @"球队招募";
    
    DiscoverRecruitViewController *teamRecruitVC = [[DiscoverRecruitViewController alloc] init];
    
    PDFSegmentVCModel *teamVCModel = [[PDFSegmentVCModel alloc] init];
    teamVCModel.titleModel = teamSegmentModel;
    teamVCModel.viewController = teamRecruitVC;
    
    [titleVCModelArray addObject:teamVCModel];
    
    
    //约战
    PDFSegmentModel *playerSegmentModel = [[PDFSegmentModel alloc] init];
    playerSegmentModel.title = @"球员招募";
    
    DiscoverRecruitViewController *playerRecruitVC = [[DiscoverRecruitViewController alloc] init];
    
    PDFSegmentVCModel *playerVCModel = [[PDFSegmentVCModel alloc] init];
    playerVCModel.titleModel = playerSegmentModel;
    playerVCModel.viewController = playerRecruitVC;
    
    [titleVCModelArray addObject:playerVCModel];
    
    
    self.segmentVCArray = titleVCModelArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
