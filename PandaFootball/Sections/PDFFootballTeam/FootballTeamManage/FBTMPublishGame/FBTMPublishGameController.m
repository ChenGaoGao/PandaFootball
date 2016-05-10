//
//  FBTMPublishGameController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/10.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "FBTMPublishGameController.h"
#import "PDFPCHMacro.h"

#import "PDFSpaceView.h"
#import "FBTPostedCell.h"
#import "Masonry.h"



static const CGFloat kTableViewCellHeight           = 44.0f;
static const CGFloat kBottomViewHeight              = 85.0f;

@interface FBTMPublishGameController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *publishButton;

@end

@implementation FBTMPublishGameController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"发布比赛"];
    
    [self setLeftBarButton];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.publishButton];
}

#pragma mark - EventResponse
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
        return 4;
    }
    
    if (section == 1) {
        return 4;
    }
    
    if (section == 2) {
        return 2;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < 2) {
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
        
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"比赛类型";
                cell.detailTextLabel.text = @"友谊赛";
            }
            if (indexPath.row == 1) {
                cell.textLabel.text = @"对战球队";
            }
            if (indexPath.row == 2) {
                cell.textLabel.text = @"比赛地点";
            }
            if (indexPath.row == 3) {
                cell.textLabel.text = @"比赛时间";
            }
        }
        
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"人数限制";
            }
            if (indexPath.row == 1) {
                cell.textLabel.text = @"报名截止时间";
            }
            if (indexPath.row == 2) {
                cell.textLabel.text = @"对方球队衣服颜色";
            }
            if (indexPath.row == 3) {
                cell.textLabel.text = @"我放球队衣服颜色";
            }
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
            cell.nameLabel.text = @"费用";
            cell.detailLabel.text = @"会打组织会打组织会打组织会打组织会打组织会打组织会打组织会打组织会打组织";
        }
        
        if (indexPath.row == 1) {
            cell.nameLabel.text = @"备注";
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
    if (section == 2) {
        return 0;
    }
    
    return PDFSpaceSmallest;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PDFSpaceView *spaceView = [[PDFSpaceView alloc] init];
    spaceView.frame = CGRectMake(0, 0, MAIN_WIDTH, PDFSpaceSmallest);
    
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
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT - kBottomViewHeight)];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = PDFColorWhite;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.separatorColor = PDFColorLineSplit;
    }
    return _tableView;
}

- (UIButton *)publishButton {
    if (!_publishButton) {
        _publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _publishButton.frame = CGRectMake(PDFSpaceBiggest,
                                          MAIN_HEIGHT - kBottomViewHeight + PDFSpaceBigger,
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
