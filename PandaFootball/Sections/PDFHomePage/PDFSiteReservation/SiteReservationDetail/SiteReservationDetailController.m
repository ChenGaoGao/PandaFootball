//
//  SiteReservationDetailController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/13.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "SiteReservationDetailController.h"
#import "PDFPCHMacro.h"
#import "SiteReservationOrderController.h"

#import "SRDetailHeaderView.h"
#import "PDFSpaceView.h"
#import "PDFSegmentControl.h"
#import "SRDetailCell.h"

static const CGFloat kTableViewCellHeight       = 38.0f;
static const CGFloat kSegmentControlHeight      = 40.0f;
static const CGFloat kSegmentCellHeight         = 77.0f;

static const CGFloat kImageViewHeight           = 125.0f;
static const CGFloat kAddressLabelHeight        = 41.0f;

@interface SiteReservationDetailController() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SRDetailHeaderView *headerView;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation SiteReservationDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"订场"];
    [self setLeftBarButton];
    
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - EventResponse
- (void)reservationBUttonHandle:(UIButton *)sender {
    SiteReservationOrderController *viewController = [[SiteReservationOrderController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    
    if (section == 1) {
        return 2;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        SRDetailCell *detailCell = [tableView dequeueReusableCellWithIdentifier:@"detailCell"
                                                                   forIndexPath:indexPath];
        
        detailCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        detailCell.startTimeLabel.text = @"08:30";
        detailCell.endTimeLabel.text = @"至 10:30";
        detailCell.siteNumberLabel.text = @"1号场";
        detailCell.headCountLabel.text = @"5人";
        detailCell.costLabel.text = @"¥450";
        detailCell.reservationButton.tag = indexPath.row;
        [detailCell.reservationButton addTarget:self
                                         action:@selector(reservationBUttonHandle:)
                               forControlEvents:UIControlEventTouchUpInside];
        
        return detailCell;
    }
    
    
    NSDictionary *dataDic = [(NSArray *)[self.dataSourceArray objectAtIndex:indexPath.section]
                             objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identify"
                                                            forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.imageView.image = [UIImage imageNamed:[dataDic objectForKey:@"image"]];
    cell.textLabel.text = [dataDic objectForKey:@"title"];
    cell.textLabel.font = PDFFontDetailBigger;
    cell.textLabel.textColor = PDFColorTextDetailMoreDeep;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return kSegmentCellHeight;
    }
    return kTableViewCellHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
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
    if (section == 1) {
        return PDFSpaceSmallest + kSegmentControlHeight;
    }
    
    return PDFSpaceSmallest;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PDFSpaceView *spaceView = [[PDFSpaceView alloc] init];
    spaceView.frame = CGRectMake(0, 0, MAIN_WIDTH, PDFSpaceSmallest);
    
    spaceView.backgroundColor = PDFColorBackground;
    
    
    if (section == 1) {
        UIView *headerView = [[UIView alloc] init];
        headerView.frame = CGRectMake(0, 0, MAIN_WIDTH, PDFSpaceSmallest + kSegmentControlHeight);
        
        [headerView addSubview:spaceView];
        
        NSMutableArray *controlArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 7; i++) {
            PDFSegmentModel *model = [[PDFSegmentModel alloc] init];
            model.title = [NSString stringWithFormat:@"2-%d", 17 + i];
            
            [controlArray addObject:model];
        }
        
        PDFSegmentControl *segmentControl = [[PDFSegmentControl alloc] init];
        segmentControl.frame = CGRectMake(0, PDFSpaceSmallest, MAIN_WIDTH, kSegmentControlHeight);
        
        segmentControl.titleArray = controlArray;
        segmentControl.hadSeparatorLine = YES;
        
        [headerView addSubview:segmentControl];
        
        return headerView;
    }

    
    return spaceView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identify"];
        [_tableView registerClass:[SRDetailCell class] forCellReuseIdentifier:@"detailCell"];
    }
    return _tableView;
}

- (SRDetailHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[SRDetailHeaderView alloc] init];
        _headerView.frame = CGRectMake(0, 0, MAIN_WIDTH, HEIGHT_From_4_7(kImageViewHeight) + kAddressLabelHeight);
        
        _headerView.siteImageView.image = [UIImage imageNamed:@"MyCenterBackground"];
        _headerView.siteAddressLabel.text = @"福田体育公园";
    }
    return _headerView;
}

- (NSMutableArray *)dataSourceArray {
    _dataSourceArray = (NSMutableArray *)@[
                                           @[
                                               @{@"image":@"PublicAddress",
                                                 @"title":@"深圳市滨河大道与福强路交汇处"},
                                               
                                               @{@"image":@"PublicPhone",
                                                 @"title":@"13565863321"},
                                               
                                               @{@"image":@"PublicPhone",
                                                 @"title":@"深圳市滨河大道与福强路交汇处深圳市滨河大道与福强路交汇处"}
                                               ],
                                           @[
                                               @{@"image":@"MyCenterMessage",
                                                 @"title":@"我的消息"},
                                               
                                               @{@"image":@"MyCenterOther",
                                                 @"title":@"其他"}
                                               ]
                                           ];
    
    return _dataSourceArray;
}


@end
