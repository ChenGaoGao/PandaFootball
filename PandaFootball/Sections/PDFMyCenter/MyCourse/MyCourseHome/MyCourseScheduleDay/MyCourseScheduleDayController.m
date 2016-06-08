//
//  MyCourseScheduleDayController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/6/2.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyCourseScheduleDayController.h"
#import "PDFPCHMacro.h"

#import "MyCourseScheduleDayCell.h"
#import "MyCourseScheduleHourController.h"


static const CGFloat kTableViewCellHeight           = 70.0f;
static const CGFloat kBottomViewHeight              = 80.0f;

@interface MyCourseScheduleDayController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *addScheduleButton;

@end

@implementation MyCourseScheduleDayController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setLeftBarButton];
    [self setNavigationTitleWhite:@"香蜜湖球场"];
    
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.addScheduleButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - EventResponse
- (void)checkButtonHandle:(UIButton *)sender {
    MyCourseScheduleHourController *viewController = [[MyCourseScheduleHourController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCourseScheduleDayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCourseScheduleDayCell"
                                                             forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.dateLabel.text = @"05-22";
    cell.totalSeeeionLabel.text = @"20场";
    cell.reserveSeeeionLabel.text = @"16场";
    cell.checkButton.tag = indexPath.row;
    [cell.checkButton addTarget:self
                         action:@selector(checkButtonHandle:)
               forControlEvents:UIControlEventTouchUpInside];
    
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
    MyCourseScheduleHourController *viewController = [[MyCourseScheduleHourController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - LazyLoad
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT - kBottomViewHeight)
                                                  style:UITableViewStylePlain];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.separatorColor = PDFColorLineSplit;
        
        [_tableView registerClass:[MyCourseScheduleDayCell class] forCellReuseIdentifier:@"MyCourseScheduleDayCell"];
    }
    return _tableView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.frame = CGRectMake(0, MAIN_HEIGHT - kBottomViewHeight, MAIN_WIDTH, kBottomViewHeight);
        _bottomView.backgroundColor = PDFColorBackground;
    }
    
    return _bottomView;
}

- (UIButton *)addScheduleButton {
    if (!_addScheduleButton) {
        _addScheduleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addScheduleButton.frame = CGRectMake(PDFSpaceBiggest, PDFSpaceBigger, MAIN_WIDTH - PDFSpaceBiggest * 2, kBottomViewHeight - PDFSpaceBigger * 2);
        
        [_addScheduleButton setBackgroundColor:PDFColorGreen];
        [_addScheduleButton setTitle:@"添加排期" forState:UIControlStateNormal];
        [_addScheduleButton setTitleColor:PDFColorWhite forState:UIControlStateNormal];
        [_addScheduleButton.titleLabel setFont:PDFFontBodyBigger];
        
        _addScheduleButton.clipsToBounds = YES;
        _addScheduleButton.layer.borderWidth = 0.5f;
        _addScheduleButton.layer.borderColor = PDFColorGreen.CGColor;
        _addScheduleButton.layer.cornerRadius = (kBottomViewHeight - PDFSpaceBigger * 2) / 2;
    }
    return _addScheduleButton;
}

@end
