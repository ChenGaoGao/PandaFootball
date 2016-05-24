//
//  MyOrderViewController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/18.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyOrderViewController.h"
#import "PDFPCHMacro.h"

#import "MyOrderCell.h"



static const CGFloat kTableViewCellHeight        = 205.0f;

@interface MyOrderViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"发现"];
    [self setLeftBarButton];
    
    self.view.backgroundColor = PDFColorBackground;
    
    [self.view addSubview:self.tableView];
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
    MyOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyOrderCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.titleTimeLabel.text = @"03-02 09:00";
    cell.orderIdLabel.text = @"订单号码：1234567890123456789";
    cell.siteNameLabel.text = @"场地：福田体育公园";
    cell.siteTypeLabel.text = @"类型：1号场－5人";
    cell.costLabel.text = @"¥450.0";
    cell.orderTimeLabel.text = @"下单时间：2016-03-02 09:00";
    
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
//    if (indexPath.section == 0) {
//        DiscoverRecruitMainController *viewController = [[DiscoverRecruitMainController alloc] init];
//        viewController.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:viewController animated:YES];
//    }
}

#pragma mark - LazyLoad
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT - TABBAR_HEIGHT)
                                                  style:UITableViewStylePlain];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.backgroundColor = PDFColorBackground;
        _tableView.separatorColor = PDFColorBackground;
        
        [_tableView registerClass:[MyOrderCell class] forCellReuseIdentifier:@"MyOrderCell"];
    }
    
    return _tableView;
}


@end
