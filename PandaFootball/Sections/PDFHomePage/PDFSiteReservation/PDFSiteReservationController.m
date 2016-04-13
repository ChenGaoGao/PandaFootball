//
//  PDFSiteReservationController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/13.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFSiteReservationController.h"
#import "PDFPCHMacro.h"

#import "PDFSiteReservationCell.h"
#import "SiteReservationDetailController.h"

static const CGFloat kTableViewCellHeight        = 89.0f;

@interface PDFSiteReservationController() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation PDFSiteReservationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dataDic = [self.dataSourceArray objectAtIndex:indexPath.row];
    
    static NSString *identify = @"identify";
    PDFSiteReservationCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[PDFSiteReservationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    cell.siteImageView.image = [UIImage imageNamed:[dataDic objectForKey:@"image"]];

    cell.siteNameLabel.text = [dataDic objectForKey:@"title"];
   
    cell.siteAddressLabel.text = [dataDic objectForKey:@"detail"];

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
    SiteReservationDetailController *viewController = [[SiteReservationDetailController alloc] init];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - LazyLoad
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT - TABBAR_HEIGHT - 49)];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSourceArray {
    _dataSourceArray = (NSMutableArray *)@[ @{@"image":@"MyCenterBackground.png",
                                              @"title":@"香蜜湖度假村足球场",
                                              @"detail":@"深圳市福田区深南大道6038号深圳市福田区深南大道6038号"},
                                            
                                            @{@"image":@"MyCenterBackground.png",
                                              @"title":@"香蜜湖度假村足球场",
                                              @"detail":@"深圳市福田区深南大道6038号"},
                                            
                                            @{@"image":@"MyCenterBackground.png",
                                              @"title":@"香蜜湖度假村足球场",
                                              @"detail":@"深圳市福田区深南大道6038号"},
                                            
                                            @{@"image":@"MyCenterBackground.png",
                                              @"title":@"香蜜湖度假村足球场",
                                              @"detail":@"深圳市福田区深南大道6038号深圳市福田区深南大道6038号"}
                                            ];
    
    return _dataSourceArray;
}
@end
