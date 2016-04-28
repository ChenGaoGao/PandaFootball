//
//  PDFDatingFightingController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/13.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFDatingFightingController.h"
#import "PDFPCHMacro.h"

#import "PDFDatingFightingCell.h"
#import "PDFSpaceView.h"

static const CGFloat kTableViewCellHeight        = 182.0f;

@interface PDFDatingFightingController() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PDFDatingFightingController

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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identify = @"identify";
    PDFDatingFightingCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[PDFDatingFightingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    
    cell.iconView.image = [UIImage imageNamed:@"MyCenterBackground"];
    cell.nameLabel.text = @"星月队";
    cell.costLabel.text = @"¥500";
    
    cell.timeLabel.text = @"2015-11-20 09:30";
    cell.phoneLabel.text = @"13912345678";
    cell.siteLabel.text = @"七人场";
    cell.addressLabel.text = @"详细地址详细地址详细地址详细地址详细地址详细地址详细地址";
    
//    cell.nameLabel.backgroundColor = PDFColorRed;
//    cell.costLabel.backgroundColor = PDFColorGreen;
//    
//    cell.timeLabel.backgroundColor = PDFColorGreen;
//    cell.phoneLabel.backgroundColor = PDFColorGreen;
//    cell.siteLabel.backgroundColor = PDFColorGreen;
//    cell.addressLabel.backgroundColor = PDFColorGreen;
    
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
    if (section == 0) {
        return 0;
    }
    else {
        return PDFSpaceSmallest;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PDFSpaceView *spaceView = [[PDFSpaceView alloc] init];
    spaceView.frame = CGRectMake(0, 0, MAIN_WIDTH, PDFSpaceSmallest);
    
    spaceView.backgroundColor = PDFColorBackground;
    
    return spaceView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    SiteReservationDetailController *viewController = [[SiteReservationDetailController alloc] init];
//    viewController.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - LazyLoad
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT - TABBAR_HEIGHT - 49)
                                                  style:UITableViewStylePlain];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    
    return _tableView;
}

@end
