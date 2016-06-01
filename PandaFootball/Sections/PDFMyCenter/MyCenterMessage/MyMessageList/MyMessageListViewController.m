//
//  MyMessageListViewController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/31.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyMessageListViewController.h"
#import "PDFPCHMacro.h"

#import "MyMessageListCell.h"
#import "MyMessageRecruitDetailViewController.h"



static const CGFloat kTableViewCellHeight        = 66.0f;

@interface MyMessageListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end


@implementation MyMessageListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationTitleWhite:@"球队比赛"];
    [self setLeftBarButton];
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Method
- (UIImage *)getImageWithType:(MyMessageListType)type isReaded:(BOOL)isReaded {
    
    switch (type) {
        case MyMessageListTypePlayers: {
            if (!isReaded) {
                return [UIImage imageNamed:@"MyMessageListPlayers"];
            }
            return [UIImage imageNamed:@"MyMessageListPlayersGray"];
        } case MyMessageListTypeRecruit: {
            if (!isReaded) {
                return [UIImage imageNamed:@"MyMessageListRecruit"];
            }
            return [UIImage imageNamed:@"MyMessageListRecruitGray"];
        } case MyMessageListTypeSystem: {
            if (!isReaded) {
                return [UIImage imageNamed:@"MyMessageListSystem"];
            }
            return [UIImage imageNamed:@"MyMessageListSystemGray"];
        }
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identify = @"identify";
    MyMessageListCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[MyMessageListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    cell.iconView.image = [self getImageWithType:self.listType isReaded:NO];
    cell.titleLabel.text = @"您有新的赛事";
    cell.timeLabel.text = @"11:34";
    cell.detailLabel.text = @"铠甲勇士VS新乐队铠甲勇士VS新乐队铠甲勇士VS新乐队铠甲勇士VS新乐队";
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.listType == MyMessageListTypeRecruit) {
        MyMessageRecruitDetailViewController *viewController = [[MyMessageRecruitDetailViewController alloc] init];
        viewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:YES];
    }
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
        _tableView.backgroundColor = PDFColorWhite;
        _tableView.separatorColor = PDFColorLineSplit;
    }
    
    return _tableView;
}

@end
