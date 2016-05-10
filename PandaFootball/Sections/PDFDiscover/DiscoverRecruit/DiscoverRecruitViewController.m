//
//  DiscoverRecruitViewController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/7.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "DiscoverRecruitViewController.h"
#import "PDFPCHMacro.h"

#import "PDFSpaceView.h"
#import "RecruitTableViewCell.h"
#import "RecruitHeaderView.h"
#import "RecruitDetailViewController.h"


static const CGFloat kTableViewCellHeight           = 68.0f;
static const CGFloat kTableViewHeaderHeight         = 59.0f;

@interface DiscoverRecruitViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RecruitHeaderView *headerView;

@end

@implementation DiscoverRecruitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
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
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecruitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recruitTableViewCell"
                                                                 forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    cell.nameLabel.text = @"招募：后卫一名";
    cell.teamLabel.text = @"星月球队";
    cell.timeLabel.text = @"04-01";
    cell.addressLabel.text = @"深圳-南山";
    
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
    
    return PDFSpaceSmallest;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PDFSpaceView *spaceView = [[PDFSpaceView alloc] init];
    spaceView.frame = CGRectMake(0, 0, MAIN_WIDTH, PDFSpaceSmallest);
    
    spaceView.backgroundColor = PDFColorBackground;
    
    return spaceView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RecruitDetailViewController *viewController = [[RecruitDetailViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - LazyLoad
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT - 49)
                                                  style:UITableViewStylePlain];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.separatorColor = PDFColorLineSplit;
        
        [_tableView registerClass:[RecruitTableViewCell class] forCellReuseIdentifier:@"recruitTableViewCell"];
    }
    return _tableView;
}

- (RecruitHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[RecruitHeaderView alloc] init];
        _headerView.frame = CGRectMake(0, 0, MAIN_WIDTH, kTableViewHeaderHeight);
        
        _headerView.dataSourceArray = @[@"前锋", @"后卫", @"门将"];
        _headerView.selectedIndex = 1;
    }
    return _headerView;
}

@end
