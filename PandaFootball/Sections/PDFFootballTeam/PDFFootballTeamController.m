//
//  PDFFootballTeamController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/11.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFFootballTeamController.h"
#import "PDFPCHMacro.h"

#import "FootballTeamHeaderView.h"
#import "FootballTeamCell.h"

#import "FootballTeamManageController.h"

static const CGFloat kHeaderViewHeight          = 157.0f;

@interface PDFFootballTeamController() <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataSourceArray;

@end

@implementation PDFFootballTeamController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"铠甲勇士"];
    
    [self setRightBarButtonItem:self.rightButton offset:PDFSpaceDefault -
     (PDFNavagationBarWidth - _rightButton.imageView.image.size.width) / 2 ];
    
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - EventResponse
- (void)rightButtonHandle:(UIButton *)sender {

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
    
    FootballTeamHeaderView *reusableView =
    [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                       withReuseIdentifier:@"DailyGoodsReusableViewIdertifier"
                                              forIndexPath:indexPath];
    
    reusableView.headIconView.image = [UIImage imageNamed:@"MyCenterBackground"];
    reusableView.nameLabel.text = @"呜啦啦啦";
    reusableView.sloganLabel.text = @"口号：我擦咧1我擦咧我擦咧我擦咧我擦咧我擦咧我擦咧454我擦咧我擦咧";
    
    reusableView.playersLabel.text = @"11人";
    reusableView.sitesLabel.text = @"22场";
    reusableView.resultLabel.text = @"16/10/6";
    
    return reusableView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FootballTeamCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:@"DailyGoodsCellIdentifier"
                                              forIndexPath:indexPath];
    
    NSDictionary *dataDic = [self.dataSourceArray objectAtIndex:indexPath.row];
    
    cell.iconView.image = [UIImage imageNamed:[dataDic objectForKey:@"image"]];
    cell.titleLabel.text = [dataDic objectForKey:@"title"];
    
    if (indexPath.row % 3 == 0) {
        cell.lineType = FBTCellLineTypeBottom;
    } else {
        cell.lineType = FBTCellLineTypeLeftBottom;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(MAIN_WIDTH, kHeaderViewHeight);

}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(MAIN_WIDTH / 3,
                      HEIGHT_From_4_7(PDFSpaceBigger) * 2 + kIconViewHeight + PDFSpaceSmaller +PDFLabelHeightDetailSmaller);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Getters
- (NSMutableArray *)dataSourceArray {
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
                                               @"controller" : @""},
                                             
                                             @{@"image" : @"FootballTeamEvent",
                                               @"title" : @"球队活动",
                                               @"controller" : @""},
                                             
                                             @{@"image" : @"FootballTeamCost",
                                               @"title" : @"球队费用",
                                               @"controller" : @""},
                                             
                                             @{@"image" : @"FootballTeamStandings",
                                               @"title" : @"球队战绩",
                                               @"controller" : @""},
                                             
                                             @{@"image" : @"FootballTeamStatistics",
                                               @"title" : @"出勤统计",
                                               @"controller" : @""},
                                             
                                             @{@"image" : @"FootballTeamManage",
                                               @"title" : @"球队管理",
                                               @"controller" : @""} ];
                         
    return _dataSourceArray;
}

#pragma mark - LazyLoad
- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame = CGRectMake(0, 0, PDFNavagationBarWidth, PDFNavagationBarHeight);
        [_rightButton setImage:[UIImage imageNamed:@"FootballTeamSwitch.png"] forState:UIControlStateNormal];
        
        [_rightButton addTarget:self
                         action:@selector(rightButtonHandle:)
               forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, MAIN_WIDTH, MAIN_HEIGHT - TABBAR_HEIGHT)
                                             collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = PDFColorBackground;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        
        [_collectionView registerClass:[FootballTeamHeaderView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"DailyGoodsReusableViewIdertifier"];
        
        [_collectionView registerClass:[FootballTeamCell class]
            forCellWithReuseIdentifier:@"DailyGoodsCellIdentifier"];
    }
    return _collectionView;
}


@end
