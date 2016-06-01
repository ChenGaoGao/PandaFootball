//
//  PDFHomePageController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/11.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFHomePageController.h"
#import "PDFPCHMacro.h"

#import "CYGBasePopupView.h"
#import "PDFPopupContentView.h"

#import "PDFSiteReservationController.h"
#import "PDFDatingFightingController.h"

#import "HomePageHeaderView.h"
#import "HomePageCell.h"

static const CGFloat kLeftButtonWidth           = 50.0f;
static const CGFloat kHeaderViewHeight          = 158.0f;

@interface PDFHomePageController () <CYGBasePopupViewDelegate, PDFPopupContentViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) CYGBasePopupView *areaPopupView;          //区域
@property (nonatomic, strong) PDFPopupContentView *areaContentView;
@property (nonatomic, strong) CYGBasePopupView *sitePopupView;          //场地（三人场，五人场等）
@property (nonatomic, strong) PDFPopupContentView *siteContentView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation PDFHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"首页"];
    
    [self setLeftBarButtonItem:self.leftButton offset:PDFSpaceDefault];
    [self setRightBarButtonItem:self.rightButton offset:PDFSpaceDefault -
     (PDFNavagationBarWidth - _rightButton.imageView.image.size.width) / 2 ];
    
    self.view.backgroundColor = PDFColorBackground;
    [self.view addSubview:self.collectionView];
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

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    
    HomePageHeaderView *reusableView =
    [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                       withReuseIdentifier:@"HomePageHeaderViewIdertifier"
                                              forIndexPath:indexPath];
    
    return reusableView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HomePageCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageCellIdentifier"
                                              forIndexPath:indexPath];
    
    NSDictionary *dataDic = [self.dataSourceArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(MAIN_WIDTH, HEIGHT_From_4_7(kHeaderViewHeight));
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(MAIN_WIDTH / 2 - 0.5, MAIN_WIDTH / 2 - 1);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
    }
    
    if (indexPath.row == 1) {
        
    }
    
    if (indexPath.row == 2) {
        
    }
    
    if (indexPath.row == 3) {
        
    }
}

#pragma mark - LazyLoad
- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = CGRectMake(0, 0, kLeftButtonWidth, PDFNavagationBarHeight);
        
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

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 1;
        flowLayout.minimumInteritemSpacing = 1;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT - TABBAR_HEIGHT)
                                             collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = PDFColorBackground;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        
        [_collectionView registerClass:[HomePageHeaderView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"HomePageHeaderViewIdertifier"];
        
        [_collectionView registerClass:[HomePageCell class]
            forCellWithReuseIdentifier:@"HomePageCellIdentifier"];
    }
    return _collectionView;
}


- (NSMutableArray *)dataSourceArray {
    if (_dataSourceArray) {
        return _dataSourceArray;
    }
    _dataSourceArray = (NSMutableArray *) @[ @{@"image" : @"FootballTeamAlbum",
                                               @"title" : @"球队相册",
                                               @"controller" : @""},
                                             
                                             @{@"image" : @"FootballTeamPosted",
                                               @"title" : @"发帖招人",
                                               @"controller" : @""},
                                             
                                             @{@"image" : @"FootballTeamSchedule",
                                               @"title" : @"球队赛程",
                                               @"controller" : @""},
                                             
                                             @{@"image" : @"FootballTeamPlayer",
                                               @"title" : @"球员列表",
                                               @"controller" : @""} ];
    
    return _dataSourceArray;
}


@end
