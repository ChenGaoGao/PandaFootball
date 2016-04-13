//
//  PDFMyCenterController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/11.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFMyCenterController.h"
#import "PDFPCHMacro.h"

static const CGFloat kTableviewCellHeight        = 55.0f;

@interface PDFMyCenterController() <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation PDFMyCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = PDFColorBackground;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setStatusBarBlank];
    //设置navigation为不透明
    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIScrollViewDelegate
// 去掉UItableview headerview黏性(sticky)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
    
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
    if (section == 0) {
        return 3;
    }
    
    if (section == 1) {
        return 3;
    }
    
    if (section == 2) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    XQBTopicInfoModel *topicInfoModel = self.topicArray.count > indexPath.section ? [self.topicArray objectAtIndex:indexPath.section] : nil;
//    
    static NSString *identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableviewCellHeight;
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

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    if (section == 0) {
//        XQBModuleHead *topicModuleHead = [[XQBModuleHead alloc] initWithFrame:CGRectMake(0, 0, MainWidth, kModuleHeadHeight)];
//        topicModuleHead.icon = [UIImage imageNamed:@"xqb_module_hot_topic"];
//        topicModuleHead.title = @"话题热贴";
//        return topicModuleHead;
//    }
//    else {
//        XQBSpaceView *spaceView = [[XQBSpaceView alloc] initWithFrame:CGRectMake(0, 0, MainWidth, XQBSpaceSmallSmall)];
//        return spaceView;
//    }
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
