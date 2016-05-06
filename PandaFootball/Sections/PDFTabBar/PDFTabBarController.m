//
//  PDFTabBarController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/11.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFTabBarController.h"
#import "PDFPCHMacro.h"
#import "PDFBaseNavigationController.h"
#import "UIImage+PureColor.h"

#import "PDFHomePageController.h"
#import "PDFDiscoverController.h"
#import "PDFFootballTeamController.h"
#import "PDFMyCenterController.h"


@interface PDFTabBarController ()

@end

@implementation PDFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *viewControllerArray = [[NSMutableArray alloc] init];
    
    //首页
    PDFHomePageController *homePageViewController = [[PDFHomePageController alloc] initWithNibName:nil bundle:nil];
    homePageViewController.title = @"球约";
    homePageViewController.tabBarItem.image =
    [[UIImage imageNamed:@"TBHomeGray.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homePageViewController.tabBarItem.selectedImage =
    [[UIImage imageNamed:@"TBHomeGreen.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    PDFBaseNavigationController *homePageNavigationController =
    [[PDFBaseNavigationController alloc] initWithRootViewController:homePageViewController];
    
    [viewControllerArray addObject:homePageNavigationController];
    
    //球队
    PDFFootballTeamController *teamViewController = [[PDFFootballTeamController alloc] initWithNibName:nil bundle:nil];
    teamViewController.title = @"球队";
    teamViewController.tabBarItem.image =
    [[UIImage imageNamed:@"TBFootballTeamGray.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    teamViewController.tabBarItem.selectedImage =
    [[UIImage imageNamed:@"TBFootballTeamGreen.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    PDFBaseNavigationController *teamNavigationController =
    [[PDFBaseNavigationController alloc] initWithRootViewController:teamViewController];
    
    [viewControllerArray addObject:teamNavigationController];
    
    //发现
    PDFDiscoverController *discoverViewController = [[PDFDiscoverController alloc] initWithNibName:nil bundle:nil];
    discoverViewController.title = @"发现";
    discoverViewController.tabBarItem.image =
    [[UIImage imageNamed:@"TBDiscoverGray.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    discoverViewController.tabBarItem.selectedImage =
    [[UIImage imageNamed:@"TBDiscoverGreen.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    PDFBaseNavigationController *discoverNavigationController =
    [[PDFBaseNavigationController alloc] initWithRootViewController:discoverViewController];
    
    [viewControllerArray addObject:discoverNavigationController];

    
    //个人中心（我）
    PDFMyCenterController *myCenterViewController = [[PDFMyCenterController alloc] initWithNibName:nil bundle:nil];
    myCenterViewController.title = @"我";
    myCenterViewController.tabBarItem.image =
    [[UIImage imageNamed:@"TBMyCenterGray.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myCenterViewController.tabBarItem.selectedImage =
    [[UIImage imageNamed:@"TBMyCenterGreen.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    PDFBaseNavigationController *myCenterNavigationController =
    [[PDFBaseNavigationController alloc] initWithRootViewController:myCenterViewController];
    
    [viewControllerArray addObject:myCenterNavigationController];
    
    self.viewControllers = (NSArray *)viewControllerArray;
    
    //设置tabBar不透明
    [[UITabBar appearance] setTranslucent:NO];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       PDFColorTextTabBarDefault,   NSForegroundColorAttributeName,
                                                       PDFFontTabBarDefault,        NSFontAttributeName,
                                                       nil]
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       PDFColorTextTabBarGreen,     NSForegroundColorAttributeName,
                                                       PDFFontTabBarDefault,        NSFontAttributeName,
                                                       nil]
                                             forState:UIControlStateSelected];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
