//
//  PDFHomePageController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/11.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFHomePageController.h"
#import "PDFPCHMacro.h"

#import "PDFSiteReservationController.h"
#import "PDFDatingFightingController.h"

#import "HomePageHeaderView.h"
#import "HomePageCell.h"

static const CGFloat kHeaderViewHeight          = 158.0f;

@interface PDFHomePageController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation PDFHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"首页"];
    
    self.view.backgroundColor = PDFColorBackground;
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    cell.iconView.image = [UIImage imageNamed:[dataDic objectForKey:@"image"]];
    cell.titleLabel.text = [dataDic objectForKey:@"title"];
    cell.describeLabel.text = [dataDic objectForKey:@"describe"];
    
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
        PDFSiteReservationController *viewController = [[PDFSiteReservationController alloc] init];
        viewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    if (indexPath.row == 1) {
        PDFDatingFightingController *viewController = [[PDFDatingFightingController alloc] init];
        viewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    if (indexPath.row == 2) {
        
    }
    
    if (indexPath.row == 3) {
        
    }
}

#pragma mark - LazyLoad
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
    _dataSourceArray = (NSMutableArray *) @[ @{@"image" : @"HomeReservation",
                                               @"title" : @"订场",
                                               @"describe" : @"未经审核的申请"},
                                             
                                             @{@"image" : @"HomeFighting",
                                               @"title" : @"约战",
                                               @"describe" : @"未经审核的申请"},
                                             
                                             @{@"image" : @"HomeRecruit",
                                               @"title" : @"招募",
                                               @"describe" : @"未经审核的申请"},
                                             
                                             @{@"image" : @"HomeLocated",
                                               @"title" : @"场地入住",
                                               @"describe" : @"未经审核的申请"} ];
    
    return _dataSourceArray;
}


@end
