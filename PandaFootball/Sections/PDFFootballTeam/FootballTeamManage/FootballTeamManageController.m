//
//  FootballTeamManageController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/19.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamManageController.h"
#import "PDFPCHMacro.h"

#import "PDFSpaceView.h"


static const CGFloat kTableViewCellHeight        = 55.0f;

@interface FootballTeamManageController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation FootballTeamManageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setLeftBarButton];
    [self setNavigationTitleWhite:@"球队管理"];
    
    self.view.backgroundColor = PDFColorBackground;
    
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
    return self.dataSourceArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)[self.dataSourceArray objectAtIndex:section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dataDic = [(NSArray *)[self.dataSourceArray objectAtIndex:indexPath.section]
                             objectAtIndex:indexPath.row];
    
    static NSString *identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    cell.imageView.image = [UIImage imageNamed:[dataDic objectForKey:@"image"]];
    
    cell.textLabel.text = [dataDic objectForKey:@"title"];
    cell.textLabel.font = PDFFontDetailBigger;
    cell.textLabel.textColor = PDFColorTextDetailMoreDeep;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section < self.dataSourceArray.count - 1) {
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

#pragma mark - Getters
- (NSMutableArray *)dataSourceArray {
    _dataSourceArray = (NSMutableArray *)@[
                                           @[
                                               @{@"image":@"FTMManagePlayers",
                                                 @"title":@"球员管理"}
                                               ],
                                           @[
                                               @{@"image":@"FTMPublishGame",
                                                 @"title":@"发布比赛"}
                                               ],
                                           @[
                                               @{@"image":@"FTMInputStandings",
                                                 @"title":@"战绩录入"}
                                               ],
                                           @[
                                               @{@"image":@"FTMInputFinancial",
                                                 @"title":@"财务录入"}
                                               ],
                                           @[
                                               @{@"image":@"FTMPublishActivity",
                                                 @"title":@"发起活动"}
                                               ]
                                           ];
    return _dataSourceArray;
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
        _tableView.backgroundColor = PDFColorBackground;
    }
    
    return _tableView;
}


@end
