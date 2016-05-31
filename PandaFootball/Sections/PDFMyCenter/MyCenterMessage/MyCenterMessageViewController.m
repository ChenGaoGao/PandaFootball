//
//  MyCenterMessageViewController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/18.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyCenterMessageViewController.h"
#import "PDFPCHMacro.h"

#import "MyCenterHeaderView.h"
#import "MyMessageListViewController.h"



static const CGFloat kTableViewCellHeight        = 50.0f;

@interface MyCenterMessageViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation MyCenterMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"我的消息"];
    [self setLeftBarButton];
    
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
    if (indexPath.row == 0) {
        MyMessageListViewController *viewController = [[MyMessageListViewController alloc] init];
        viewController.listType = MyMessageListTypePlayers;
        viewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    if (indexPath.row == 1) {
        MyMessageListViewController *viewController = [[MyMessageListViewController alloc] init];
        viewController.listType = MyMessageListTypeRecruit;
        viewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    if (indexPath.row == 2) {
        MyMessageListViewController *viewController = [[MyMessageListViewController alloc] init];
        viewController.listType = MyMessageListTypeSystem;
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
        _tableView.backgroundColor = PDFColorBackground;
        _tableView.separatorColor = PDFColorLineSplit;
    }
    
    return _tableView;
}

- (NSMutableArray *)dataSourceArray {
    if (_dataSourceArray) {
        return _dataSourceArray;
    }
    
    _dataSourceArray = (NSMutableArray *)@[
                                           @{@"image":@"MyMessageListPlayers",
                                             @"title":@"球员比赛"},
                                           
                                           @{@"image":@"MyMessageListRecruit",
                                             @"title":@"招募审核"},
                                           
                                           @{@"image":@"MyMessageListSystem",
                                             @"title":@"系统消息"}
                                           ];
    return _dataSourceArray;
}

@end
