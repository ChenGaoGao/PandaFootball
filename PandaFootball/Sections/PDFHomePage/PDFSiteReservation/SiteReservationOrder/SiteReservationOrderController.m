//
//  SiteReservationOrderController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/6.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "SiteReservationOrderController.h"
#import "PDFPCHMacro.h"

#import "PDFSpaceView.h"
#import "SROFootballTeamCell.h"
#import "SROConfirmView.h"

static const CGFloat kConfirmViewHeight             = 50.0f;
static const CGFloat kFootballTeamCellHeight        = 70.0f;
static const CGFloat kTableViewCellHeight           = 44.0f;

@interface SiteReservationOrderController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) SROConfirmView *confirmView;

@end

@implementation SiteReservationOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"确认订单"];
    [self setLeftBarButton];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.confirmView];
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 2) {
        return 1;
    }
    
    if (section == 1) {
        return 3;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"identify";
    
    if (indexPath.section == 0) {
        SROFootballTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[SROFootballTeamCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.headIconView.image = [UIImage imageNamed:@"MyCenterBackground"];
        cell.nameLabel.text = @"星月队";
        
        cell.detailTextLabel.text = @"球队切换";
        cell.detailTextLabel.font = PDFFontDetailDefault;
        cell.detailTextLabel.textColor = PDFColorTextBodyLight;
        
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    
    if (indexPath.section == 1) {
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"SROrderSite"];
            cell.textLabel.text = @"场地：    福田体育公园";
        }
        
        if (indexPath.row == 1) {
            cell.imageView.image = [UIImage imageNamed:@"SROrderTime"];
            cell.textLabel.text = @"时间：    2016-02-16 09:00-11:00";
        }
        
        if (indexPath.row == 2) {
            cell.imageView.image = [UIImage imageNamed:@"SROrderType"];
            cell.textLabel.text = @"类型：    1号场-5人";
        }
    }
    
    if (indexPath.section == 2) {
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.textLabel.text = @"比赛类型";
        cell.detailTextLabel.text = @"对内训练";
    }
    
    
    cell.textLabel.font = PDFFontDetailDefault;
    cell.textLabel.textColor = PDFColorTextBodyLight;
    
    cell.detailTextLabel.font = PDFFontDetailDefault;
    cell.detailTextLabel.textColor = PDFColorTextBodyLight;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return kFootballTeamCellHeight;
    }
    
    return kTableViewCellHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return;
    }
    
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
    if (section == 0) {
        return 0;
    }
    
    return PDFSpaceSmallest;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PDFSpaceView *spaceView = [[PDFSpaceView alloc] init];
    spaceView.frame = CGRectMake(0, 0, MAIN_WIDTH, PDFSpaceSmallest);
    
    spaceView.backgroundColor = PDFColorBackground;

    
    return spaceView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - LazyLoad
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,
                                                                   MAIN_WIDTH,
                                                                   MAIN_HEIGHT - kConfirmViewHeight)
                                                  style:UITableViewStylePlain];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}

- (SROConfirmView *)confirmView {
    if (!_confirmView) {
        _confirmView = [[SROConfirmView alloc] init];
        _confirmView.frame = CGRectMake(0, MAIN_HEIGHT - kConfirmViewHeight, MAIN_WIDTH, kConfirmViewHeight);
        
        _confirmView.costLabel.text = @"¥450.0";
    }
    return _confirmView;
}

@end
