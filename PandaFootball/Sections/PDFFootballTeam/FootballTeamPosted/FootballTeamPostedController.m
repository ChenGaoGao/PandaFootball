//
//  FootballTeamPostedController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/19.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FootballTeamPostedController.h"
#import "PDFPCHMacro.h"

#import "PDFSpaceView.h"
#import "FBTPostedHeaderView.h"
#import "FBTPostedCell.h"
#import "Masonry.h"



static const CGFloat kTableViewCellHeight           = 44.0f;
static const CGFloat kHeaderViewHeight              = 68.0f;

static const CGFloat kBottomViewHeight              = 85.0f;

@interface FootballTeamPostedController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) FBTPostedHeaderView *headerView;
@property (nonatomic, strong) NSMutableArray *recruitDataArray;
@property (nonatomic, strong) PDFSpaceView *bottomView;
@property (nonatomic, strong) UIButton *publishButton;

@end

@implementation FootballTeamPostedController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"发帖招人"];
    
    [self setLeftBarButton];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.publishButton];
    
    self.recruitDataArray = [[NSMutableArray alloc] init];
}

#pragma mark - EventResponse
- (void)footerButtonHandle:(UIButton *)sender {
    [self.recruitDataArray addObject:@"后卫：1人"];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.recruitDataArray.count - 1 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    
    if (self.recruitDataArray.count > 0) {
        [sender setTitle:@"继续添加" forState:UIControlStateNormal];
        [sender setTitleColor:PDFColorGreen forState:UIControlStateNormal];
        [sender setImage:[UIImage imageNamed:@"PublicSearch"] forState:UIControlStateNormal];
        
        sender.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [sender setTitleEdgeInsets:UIEdgeInsetsMake(0, PDFSpaceSmallish / 2, 0, 0)];
        [sender setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, PDFSpaceSmallish / 2)];
    }
}

- (void)accessoryButtonHandle:(UIButton *)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    
    [self.recruitDataArray removeObjectAtIndex:sender.tag];
    
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    
    if (self.recruitDataArray.count == 0) {
        sender.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [sender setTitle:@"招募位置" forState:UIControlStateNormal];
        [sender setTitleColor:PDFColorTextDetailDefault forState:UIControlStateNormal];
        
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
    }
}

- (void)publishButtonHandle:(UIButton *)sender {
    
}

#pragma mark - UIScrollViewDelegate
// 去掉UItableview headerview黏性(sticky)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = PDFSpaceSmallest + kTableViewCellHeight;
    
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
        return self.recruitDataArray.count;
    }
    
    if (section == 1) {
        return 2;
    }
    
    if (section == 2) {
        return 2;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *section0 = @"section0";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:section0];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:section0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
        cell.textLabel.font = PDFFontDetailDefault;
        cell.textLabel.text = [self.recruitDataArray objectAtIndex:indexPath.row];
        cell.textLabel.textColor = PDFColorTextBodyLight;
        
        UIButton *accessoryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        accessoryButton.frame = CGRectMake(0, 0, 20, 20);
        accessoryButton.backgroundColor = PDFColorRed;
        
        accessoryButton.tag = indexPath.row;
        [accessoryButton addTarget:self
                            action:@selector(accessoryButtonHandle:)
                  forControlEvents:UIControlEventTouchUpInside];
        
        cell.accessoryView = accessoryButton;
        
        return cell;
    }
    
    if (indexPath.section == 1) {
        static NSString *section1 = @"section1";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:section1];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:section1];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.textLabel.font = PDFFontDetailDefault;
        cell.textLabel.textColor = PDFColorTextDetailDefault;
        
        cell.detailTextLabel.font = PDFFontDetailDefault;
        cell.detailTextLabel.textColor = PDFColorTextBodyLight;
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"招募类型";
            cell.detailTextLabel.text = @"长期球员";
        }
        
        if (indexPath.row == 1) {
            cell.textLabel.text = @"招募截止时间";
            cell.detailTextLabel.text = @"2015-03-20";
        }
        return cell;
    }
    
    if (indexPath.section == 2) {
        static NSString *section2 = @"section2";
        
        FBTPostedCell *cell = [tableView dequeueReusableCellWithIdentifier:section2];
        
        if (!cell) {
            cell = [[FBTPostedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:section2];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
        if (indexPath.row == 0) {
            cell.nameLabel.text = @"招募要求";
            cell.detailLabel.text = @"会打组织会打组织会打组织会打组织会打组织会打组织会打组织会打组织会打组织";
        }
        
        if (indexPath.row == 1) {
            cell.nameLabel.text = @"报名细则";
            cell.detailLabel.text = @"10元报名费10元报名费10元报名费10元报名费10元报名费10元报名费";
        }
        return cell;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        NSString *string = nil;
        if (indexPath.row == 0) {
            string = @"会打组织会打组织会打组织会打组织会打组织会打组织会打组织会打组织会打组织";
        }
        
        if (indexPath.row == 1) {
            string = @"10元报名费10元报名费10元报名费10元报名费10元报名费10元报名费";
        }
        
        //创建一个跟tableview Cell的 detailLabel 相同的label，用于自动计算高度
        UILabel *label = [[UILabel alloc] init];
        label.font = PDFFontDetailDefault;
        label.numberOfLines = 0;
        label.lineBreakMode = NSLineBreakByCharWrapping;
        label.hidden = YES;
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.height.mas_greaterThanOrEqualTo(@(PDFLabelHeightDetailDefault));
            make.left.mas_equalTo(@(PDFSpaceDefault));
            make.right.mas_equalTo(@(-PDFSpaceDefault));
        }];
        
        label.text = string;
        [label setPreferredMaxLayoutWidth:(MAIN_WIDTH - PDFSpaceDefault * 2)];
        [label sizeToFit];
        CGSize size = [label systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        
        [label removeFromSuperview];
        
        
        return kTableViewCellHeight + size.height + PDFSpaceDefault;
    }
    
    
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
    if (section == 1) {
        return kTableViewCellHeight + PDFSpaceSmallest;
    }
    
    if (section == 2) {
        return 0;
    }
    
    return PDFSpaceSmallest;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PDFSpaceView *spaceView = [[PDFSpaceView alloc] init];
    spaceView.frame = CGRectMake(0, 0, MAIN_WIDTH, PDFSpaceSmallest);
    
    if (section == 1) {
        UIView *headerView = [[UIView alloc] init];
        headerView.frame = CGRectMake(0, 0, MAIN_WIDTH, kTableViewCellHeight);
        
        headerView.backgroundColor = PDFColorWhite;
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(PDFSpaceDefault, 0, MAIN_WIDTH - PDFSpaceDefault * 2, kTableViewCellHeight);
        
        [button.titleLabel setFont:PDFFontDetailDefault];
        
        [button addTarget:self action:@selector(footerButtonHandle:) forControlEvents:UIControlEventTouchUpInside];
        
        if (self.recruitDataArray.count == 0) {
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [button setTitle:@"招募位置" forState:UIControlStateNormal];
            [button setTitleColor:PDFColorTextDetailDefault forState:UIControlStateNormal];
        }
        
        if (self.recruitDataArray.count > 0) {
            [button setTitle:@"继续添加" forState:UIControlStateNormal];
            [button setTitleColor:PDFColorGreen forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"PublicSearch"] forState:UIControlStateNormal];
            
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [button setTitleEdgeInsets:UIEdgeInsetsMake(0, PDFSpaceSmallish / 2, 0, 0)];
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, PDFSpaceSmallish / 2)];
        }
        
        [headerView addSubview:button];
        
        
        UIView *lineView = [[UIView alloc] init];
        lineView.frame = CGRectMake(0, 0, MAIN_WIDTH, 0.5);
        lineView.backgroundColor = PDFColorLineSplit;
        
        [headerView addSubview:lineView];
        
        spaceView.frame = CGRectMake(0, kTableViewCellHeight, MAIN_WIDTH, PDFSpaceSmallest);
        [headerView addSubview:spaceView];
        
        return headerView;
    }

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
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT - TABBAR_HEIGHT - kBottomViewHeight)];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = PDFColorWhite;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.separatorColor = PDFColorLineSplit;
    }
    return _tableView;
}

- (FBTPostedHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[FBTPostedHeaderView alloc] init];
        _headerView.frame = CGRectMake(0, 0, MAIN_WIDTH, kHeaderViewHeight);
        
        _headerView.headerIcon.image = [UIImage imageNamed:@""];
        _headerView.teamNameLabel.text = @"星月队伍";
        _headerView.addressLabel.text = @"深圳南山";
    }
    return _headerView;
}

- (PDFSpaceView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[PDFSpaceView alloc] init];
        _bottomView.frame = CGRectMake(0, MAIN_HEIGHT - kBottomViewHeight, MAIN_WIDTH, kBottomViewHeight);
    }
    return _bottomView;
}

- (UIButton *)publishButton {
    if (!_publishButton) {
        _publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _publishButton.frame = CGRectMake(PDFSpaceBiggest,
                                          PDFSpaceBigger,
                                          MAIN_WIDTH - PDFSpaceBiggest * 2,
                                          kBottomViewHeight - PDFSpaceBigger * 2);
        
        [_publishButton setBackgroundColor:PDFColorGreen];
        [_publishButton setTitle:@"发布" forState:UIControlStateNormal];
        [_publishButton setTitleColor:PDFColorWhite forState:UIControlStateNormal];
        
        _publishButton.clipsToBounds = YES;
        _publishButton.layer.borderWidth = 0.5;
        _publishButton.layer.borderColor = PDFColorGreen.CGColor;
        _publishButton.layer.cornerRadius = (kBottomViewHeight - PDFSpaceBigger * 2) / 2;
        
        [_publishButton addTarget:self
                           action:@selector(publishButtonHandle:)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    return _publishButton;
}

@end
