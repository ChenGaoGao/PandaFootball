//
//  MyCourseHomeViewController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/2.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyCourseHomeViewController.h"
#import "PDFPCHMacro.h"

#import "MyCourseHomeHeaderView.h"
#import "MyCourseHomeCell.h"
#import "MyCourseScheduleDayController.h"



static const CGFloat kTableViewCellHeight           = 68.0f;
static const CGFloat kTableViewHeaderHeight         = 150.0f;

@interface MyCourseHomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MyCourseHomeHeaderView *headerView;

@end

@implementation MyCourseHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setLeftBarButton];
    [self setNavigationTitleWhite:@"香蜜湖球场"];
    
    [self.view addSubview:self.tableView];
    [self.tableView setTableHeaderView:self.headerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCourseHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCourseHomeCell"
                                                                 forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    if (indexPath.row == 0) {
        cell.nameLabel.text = @"球场排期";
        cell.describeLabel.text = @"添加球场场次";
    }
    
    if (indexPath.row == 1) {
        cell.nameLabel.text = @"排期模版";
        cell.describeLabel.text = @"建立球场排期模版";
    }
    
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
    return 0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MyCourseScheduleDayController *viewController = [[MyCourseScheduleDayController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    if (indexPath.row == 1) {
        
    }
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
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.separatorColor = PDFColorLineSplit;
        
        [_tableView registerClass:[MyCourseHomeCell class] forCellReuseIdentifier:@"MyCourseHomeCell"];
    }
    return _tableView;
}

- (MyCourseHomeHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[MyCourseHomeHeaderView alloc] init];
        _headerView.frame = CGRectMake(0, 0, MAIN_WIDTH, HEIGHT_From_4_7(kTableViewHeaderHeight));
        _headerView.backgroundColor = PDFColorGreen;
        
        _headerView.moneyLabel.text = @"¥500.00";
    }
    return _headerView;
}

@end
