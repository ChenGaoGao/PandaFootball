//
//  FootballTeamPostedController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/19.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamPostedController.h"
#import "PDFPCHMacro.h"

static const CGFloat kTableViewCellHeight           = 44.0f;

static const CGFloat kHeaderViewHeight              = 80.0f;



@interface FootballTeamPostedController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;

@end

@implementation FootballTeamPostedController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"发帖招人"];
    
    [self setLeftBarButton];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    
    if (section == 1) {
        return 4;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSDictionary *dataDic = [self.dataSourceArray objectAtIndex:indexPath.row];
    
//    static NSString *identify = @"identify";
//    PDFSiteReservationCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
//    if (!cell) {
//        cell = [[PDFSiteReservationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
//        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    }
//    
//    cell.siteImageView.image = [UIImage imageNamed:[dataDic objectForKey:@"image"]];
//    
//    cell.siteNameLabel.text = [dataDic objectForKey:@"title"];
//    
//    cell.siteAddressLabel.text = [dataDic objectForKey:@"detail"];
//    
//    if (indexPath.row == 0) {
//        cell.reservationType = SRCellReservationTypeUnable;
//    }
    
    //    cell.siteNameLabel.backgroundColor = PDFColorGreen;
    //    cell.siteAddressLabel.backgroundColor = PDFColorGreen;
    
//    return cell;
    return nil;
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
//    SiteReservationDetailController *viewController = [[SiteReservationDetailController alloc] init];
//    viewController.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:viewController animated:YES];
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
        _tableView.separatorColor = PDFColorLineSplit;
    }
    
    return _tableView;
}

@end
