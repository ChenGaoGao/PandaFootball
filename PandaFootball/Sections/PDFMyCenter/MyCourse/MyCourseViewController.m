//
//  MyCourseViewController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/2.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyCourseViewController.h"
#import "PDFPCHMacro.h"

#import "PDFSpaceView.h"
#import "PDFSiteReservationCell.h"
#import "MyCourseHomeViewController.h"


static const CGFloat kTableViewCellHeight           = 89.0f;
static const CGFloat kHeaderHeightInSection         = 35.0f;

@interface MyCourseViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MyCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setLeftBarButton];
    [self setNavigationTitleWhite:@"我的球场"];
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    PDFSiteReservationCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[PDFSiteReservationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    cell.siteImageView.image = [UIImage imageNamed:@"MyCenterBackground.png"];
    
    cell.siteNameLabel.text = @"香蜜湖度假村足球场";
    
    cell.siteAddressLabel.text = @"深圳市福田区";
    
    [cell.reservationButton setTitle:@"可编辑" forState:UIControlStateNormal];
    [cell.reservationButton setTitle:@"待审核" forState:UIControlStateSelected];
    
    if (indexPath.section == 1) {
        cell.reservationType = SRCellReservationTypeUnable;
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
    return kHeaderHeightInSection;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PDFSpaceView *spaceView = [[PDFSpaceView alloc] init];
    spaceView.frame = CGRectMake(0, 0, MAIN_WIDTH, kHeaderHeightInSection);
    
    spaceView.backgroundColor = PDFColorBackground;
    
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(PDFSpaceSmaller, 0, MAIN_WIDTH - PDFSpaceSmaller * 2, kHeaderHeightInSection);
    label.font = PDFFontDetailDefault;
    label.textColor = PDFColorTextDetailDefault;
    
    [spaceView addSubview:label];
    
    if (section == 0) {
        label.text = @"已审核";
    }
    
    if (section == 1) {
        label.text = @"待审核";
    }
    
    return spaceView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCourseHomeViewController *viewController = [[MyCourseHomeViewController alloc] init];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
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
        _tableView.separatorColor = PDFColorLineSplit;
    }
    
    return _tableView;
}

@end
