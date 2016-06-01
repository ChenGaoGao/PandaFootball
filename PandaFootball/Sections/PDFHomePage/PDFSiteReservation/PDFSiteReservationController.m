//
//  PDFSiteReservationController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/13.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFSiteReservationController.h"
#import "PDFPCHMacro.h"

#import "CYGBasePopupView.h"
#import "PDFPopupContentView.h"

#import "PDFSiteReservationCell.h"
#import "SiteReservationDetailController.h"

static const CGFloat kLeftButtonWidth               = 50.0f;
static const CGFloat kTableViewCellHeight           = 89.0f;

@interface PDFSiteReservationController () <CYGBasePopupViewDelegate, PDFPopupContentViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) CYGBasePopupView *areaPopupView;          //区域
@property (nonatomic, strong) PDFPopupContentView *areaContentView;
@property (nonatomic, strong) CYGBasePopupView *sitePopupView;          //场地（三人场，五人场等）
@property (nonatomic, strong) PDFPopupContentView *siteContentView;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation PDFSiteReservationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setLeftBarButton];
    [self setNavigationTitleWhite:@" "];
    
//    [self setLeftBarButtonItem:self.leftButton offset:PDFSpaceDefault];
//    [self setRightBarButtonItem:self.rightButton offset:PDFSpaceDefault -
//     (PDFNavagationBarWidth - _rightButton.imageView.image.size.width) / 2 ];
    
    [self setRightBarButtonItems:@[self.rightButton, self.leftButton]
                          offset:PDFSpaceDefault - (PDFNavagationBarWidth - _rightButton.imageView.image.size.width) / 2];
    
    
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - EventResponse
- (void)leftButtonHandle:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        //选区域的时候，若有场地选择，场地选择先dismiss
        if (_rightButton.selected) {
            _rightButton.selected = NO;
            [self.sitePopupView dismissView];
        }
        
        if (self.areaPopupView.contentView == nil) {
            [self.areaPopupView setContentView:self.areaContentView];
        }
        [self.areaPopupView showInView:self.view];
    }
    
    if (!sender.selected) {
        [self.areaPopupView dismissView];
    }
}

- (void)rightButtonHandle:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        //选场地的时候，若有区域选择，区域选择先dismiss
        if (_leftButton.selected) {
            _leftButton.selected = NO;
            [self.areaPopupView dismissView];
        }
        
        if (self.sitePopupView.contentView == nil) {
            [self.sitePopupView setContentView:self.siteContentView];
        }
        [self.sitePopupView showInView:self.view];
    }
    
    if (!sender.selected) {
        [self.sitePopupView dismissView];
    }
}

#pragma mark - CYGBasePopupViewDelegate
- (void)basePopupView:(CYGBasePopupView *)popupView backgroundClicked:(UIButton *)background {
    if (popupView.tag == 0) {
        _leftButton.selected = NO;
    }
    
    if (popupView.tag == 1) {
        _rightButton.selected = NO;
    }
}

#pragma mark - PDFPopupContentViewDelegate
- (void)popupContentView:(PDFPopupContentView *)contentView didSelectAtIndex:(NSInteger)index {
    if (contentView.tag == 0) {
        _leftButton.selected = NO;
        [self.areaPopupView dismissView];
    }
    
    if (contentView.tag == 1) {
        _rightButton.selected = NO;
        [self.sitePopupView dismissView];
    }
}

- (void)popupContentView:(PDFPopupContentView *)contentView bottomButtonDefaultClicked:(UIButton *)sender {
    if (contentView.tag == 0) {
        _leftButton.selected = NO;
        [self.areaPopupView dismissView];
    }
    
    if (contentView.tag == 1) {
        _rightButton.selected = NO;
        [self.sitePopupView dismissView];
    }
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
    PDFSiteReservationCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[PDFSiteReservationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    cell.siteImageView.image = [UIImage imageNamed:[dataDic objectForKey:@"image"]];

    cell.siteNameLabel.text = [dataDic objectForKey:@"title"];
   
    cell.siteAddressLabel.text = [dataDic objectForKey:@"detail"];
    
    if (indexPath.row == 0) {
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
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SiteReservationDetailController *viewController = [[SiteReservationDetailController alloc] init];
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - LazyLoad
- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = CGRectMake(0, 0, kLeftButtonWidth, PDFNavagationBarHeight);
        _leftButton.backgroundColor = PDFColorRed;
        
        [_leftButton setTitle:@"深圳" forState:UIControlStateNormal];
        [_leftButton setTitleColor:PDFColorWhite forState:UIControlStateNormal];
        [_leftButton.titleLabel setFont:PDFFontBodySmaller];
        
        [_leftButton setImage:[UIImage imageNamed:@"PublicPullDown.png"] forState:UIControlStateNormal];
        [_leftButton setImage:[UIImage imageNamed:@"PublicPullUp.png"] forState:UIControlStateSelected];
        
        [_leftButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_leftButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -_leftButton.imageView.image.size.width, 0, 0)];
        [_leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, kLeftButtonWidth - _leftButton.imageView.image.size.width, 0, 0)];
        
        [_leftButton addTarget:self
                        action:@selector(leftButtonHandle:)
              forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(0, 0, PDFNavagationBarWidth, PDFNavagationBarHeight);
        [_rightButton setImage:[UIImage imageNamed:@"PublicFilter.png"] forState:UIControlStateNormal];
        
        [_rightButton addTarget:self
                         action:@selector(rightButtonHandle:)
               forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

- (CYGBasePopupView *)areaPopupView {
    if (!_areaPopupView) {
        _areaPopupView = [[CYGBasePopupView alloc] init];
        _areaPopupView.frame = CGRectMake(0, 0, VIEW_WIDTH(self.view), VIEW_HEIGHT(self.view));
        
        _areaPopupView.tag = 0;
        _areaPopupView.delegate = self;
    }
    return _areaPopupView;
}

- (CYGBasePopupView *)sitePopupView {
    if (!_sitePopupView) {
        _sitePopupView = [[CYGBasePopupView alloc] init];
        _sitePopupView.frame = CGRectMake(0, 0, VIEW_WIDTH(self.view), VIEW_HEIGHT(self.view));
        
        _sitePopupView.tag = 1;
        _sitePopupView.delegate = self;
    }
    return _sitePopupView;
}

- (PDFPopupContentView *)areaContentView {
    if (!_areaContentView) {
        _areaContentView = [[PDFPopupContentView alloc] init];
        _areaContentView.frame = CGRectMake(0, 0, MAIN_WIDTH, kBottomButtonDefaultHeight);
        
        _areaContentView.tag = 0;
        _areaContentView.delegate = self;
        _areaContentView.dataSourceArray = (NSMutableArray *)@[@"全部", @"福田区", @"龙岗区", @"南山区", @"宝安区", @"盐田区", @"龙华新区", @"大鹏新区", @"坪山新区", @"光明新区"];
    }
    return _areaContentView;
}

- (PDFPopupContentView *)siteContentView {
    if (!_siteContentView) {
        _siteContentView = [[PDFPopupContentView alloc] init];
        _siteContentView.frame = CGRectMake(0, 0, MAIN_WIDTH, kBottomButtonDefaultHeight);
        
        _siteContentView.tag = 1;
        _siteContentView.delegate = self;
        _siteContentView.dataSourceArray = (NSMutableArray *)@[@"全部", @"三人场", @"五人场", @"七人场", @"十一人场"];
    }
    return _siteContentView;
}

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

- (NSMutableArray *)dataSourceArray {
    _dataSourceArray = (NSMutableArray *)@[ @{@"image":@"MyCenterBackground.png",
                                              @"title":@"香蜜湖度假村足球场",
                                              @"detail":@"深圳市福田区"},
                                            
                                            @{@"image":@"MyCenterBackground.png",
                                              @"title":@"香蜜湖度假村足球场",
                                              @"detail":@"深圳市福田区"},
                                            
                                            @{@"image":@"MyCenterBackground.png",
                                              @"title":@"香蜜湖度假村足球场",
                                              @"detail":@"深圳市福田区"},
                                            
                                            @{@"image":@"MyCenterBackground.png",
                                              @"title":@"香蜜湖度假村足球场",
                                              @"detail":@"深圳市福田区"}
                                            ];
    
    return _dataSourceArray;
}
@end
