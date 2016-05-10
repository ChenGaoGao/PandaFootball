//
//  FootballTeamScheduleController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/21.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamScheduleController.h"
#import "PDFPCHMacro.h"
#import "FootballTeamScheduleCell.h"
#import "PDFSpaceView.h"

static const CGFloat kTableViewCellHeight           = 76.0f;
static const CGFloat kCellHeaderHeight              = 35.0f;

@interface FootballTeamScheduleController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FootballTeamScheduleController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setLeftBarButton];
    [self setNavigationTitleWhite:@"球队赛程"];
    
    self.view.backgroundColor = PDFColorBackground;
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate
// 去掉UItableview headerview黏性(sticky)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = kTableViewCellHeight;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"identify";
    FootballTeamScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[FootballTeamScheduleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    cell.hostTeamIconView.image = [UIImage imageNamed:@"MyCenterBackground"];
    cell.hostTeamNameLabel.text = @"星月队";
    
    cell.guestTeamIconView.image = [UIImage imageNamed:@"MyCenterBackground"];
    cell.guestTeamNameLabel.text = @"铠甲勇士";
    
    if (indexPath.section == 1) {
        cell.versusState = FBTSCVersusStateFinished;
        cell.versusScoreLabel.text = @"3 - 1";
    }
    cell.versusTimeLabel.text = @"02-28 09:30";
    
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
    return kCellHeaderHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PDFSpaceView *spaceView = [[PDFSpaceView alloc] init];
    spaceView.frame = CGRectMake(0, 0, MAIN_WIDTH, kCellHeaderHeight);
    
    UILabel *headerLabel = [[UILabel alloc] init];
    headerLabel.frame = CGRectMake(PDFSpaceSmallest, 0, MAIN_WIDTH - PDFSpaceSmallish * 2, kCellHeaderHeight);
    headerLabel.font = PDFFontDetailDefault;
    headerLabel.textColor = PDFColorTextBodyLight;
    
    if (section == 0) {
        headerLabel.text = @"未完成";
    }
    
    if (section == 1) {
        headerLabel.text = @"已完成";
    }
    
    [spaceView addSubview:headerLabel];
    
    return spaceView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Getters


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
        _tableView.separatorColor = PDFColorLineSplit;
    }
    
    return _tableView;
}

@end
