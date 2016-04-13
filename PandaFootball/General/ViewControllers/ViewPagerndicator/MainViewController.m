//
//  MainViewController.m
//  网易首页
//
//  Created by City--Online on 15/9/1.
//  Copyright (c) 2015年 City--Online. All rights reserved.
//

#import "MainViewController.h"
#import "TopScrollView.h"
#import "BottomScrollView.h"


@interface MainViewController ()<TopScrollViewDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,strong) TopScrollView *topScrollView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.interactivePopGestureRecognizer.enabled=YES;
    self.navigationController.interactivePopGestureRecognizer.delegate=self;
}
-(void)initUI
{
    NSMutableArray *titleArray=[[NSMutableArray alloc]init];
    NSMutableArray *viewControllerArray=[[NSMutableArray alloc]init];
    for (TitleVCModel *model in _titleVcModelArray) {
        [titleArray addObject:model.title];
        [viewControllerArray addObject:model.viewController];
        [self addChildViewController:model.viewController];
    }
    _topScrollView=[[TopScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 49) andItems:titleArray];
    _topScrollView.selectedIndex = 0;
    _topScrollView.topViewDelegate=self;
    [self.view addSubview:_topScrollView];
    
    __weak MainViewController *weakSelf = self;
    _bottomScrollView=[[BottomScrollView alloc]initWithFrame:CGRectMake(0, 49, self.view.bounds.size.width, self.view.frame.size.height-49-64) andItems:viewControllerArray];
    _bottomScrollView.pageChangedBlock=^(int index)
    {
        [weakSelf.topScrollView selectIndex:index withFlag:NO];
    };
    [self.view addSubview:_bottomScrollView];
}
-(void)barSelectedIndexChanged:(int)newIndex
{
    [_bottomScrollView setShowPageWithIndex:newIndex];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    if (self.bottomScrollView.contentOffset.x<0.0&&otherGestureRecognizer.class==[UIScreenEdgePanGestureRecognizer class]) {
        return YES;
    }
    return NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
