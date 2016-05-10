//
//  FootballTeamAttendanceController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/3.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamAttendanceController.h"
#import "PDFPCHMacro.h"

#import "PDFSpaceView.h"
#import "FBTAttendanceTableHeaderView.h"
#import "FootballTeamAttendanceCell.h"


static const CGFloat kTableHeaderViewHeight         = 110.0f;
static const CGFloat kTableViewCellHeight           = 44.0f;

@interface FootballTeamAttendanceController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) FBTAttendanceTableHeaderView *tableHeaderView;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation FootballTeamAttendanceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setLeftBarButton];
    [self setNavigationTitleWhite:@"出勤排行"];
    
    self.view.backgroundColor = PDFColorBackground;
    
    [self.view addSubview:self.tableView];
    [self.tableView setTableHeaderView:self.tableHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate
// 去掉UItableview headerview黏性(sticky)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = PDFSpaceSmallest;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"identify";
    FootballTeamAttendanceCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[FootballTeamAttendanceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    cell.identifyLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.playerNameLabel.text = @"张三";
    cell.attendanceCountLabel.text = @"88";
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
#ifdef __IPHONE_8_0
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
#endif
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PDFSpaceView *spaceView = [[PDFSpaceView alloc] init];
    spaceView.frame = CGRectMake(0, 0, MAIN_WIDTH, 0.5);
    
    spaceView.backgroundColor = PDFColorBackground;
    
    return spaceView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Getters
- (NSMutableArray *)dataSourceArray {
    _dataSourceArray = (NSMutableArray *)@[
                                           @[
                                               @{@"image":@"FTMManagePlayers",
                                                 @"title":@"球员管理"}
                                               ],
                                           @[
                                               @{@"image":@"FTMPublishGame",
                                                 @"title":@"发布比赛"}
                                               ],
                                           @[
                                               @{@"image":@"FTMInputStandings",
                                                 @"title":@"战绩录入"}
                                               ],
                                           @[
                                               @{@"image":@"FTMInputFinancial",
                                                 @"title":@"财务录入"}
                                               ],
                                           @[
                                               @{@"image":@"FTMPublishActivity",
                                                 @"title":@"发起活动"}
                                               ]
                                           ];
    return _dataSourceArray;
}

#pragma mark - LazyLoad
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT)
                                                  style:UITableViewStylePlain];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.backgroundColor = PDFColorBackground;
        _tableView.separatorColor = PDFColorLineSplit;
    }
    
    return _tableView;
}

- (FBTAttendanceTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[FBTAttendanceTableHeaderView alloc] init];
        _tableHeaderView.frame = CGRectMake(0, 0, MAIN_WIDTH, kTableHeaderViewHeight);
        
        _tableHeaderView.headerIconView.image = [UIImage imageNamed:@"MyCenterBackground"];
        _tableHeaderView.nameLabel.text = @"奔跑的汉子";
        _tableHeaderView.rankingLabel.text = @"第3名";
        _tableHeaderView.attendanceCountLabel.text = @"17";
    }
    return _tableHeaderView;
}

@end
