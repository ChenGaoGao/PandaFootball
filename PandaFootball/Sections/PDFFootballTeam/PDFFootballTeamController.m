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

static const CGFloat kBackgroundViewHeight      = 210.0f;

@interface PDFFootballTeamController() <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation PDFFootballTeamController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"铠甲勇士"];
    
    [self setRightBarButtonItem:self.rightButton offset:PDFSpaceDefault -
     (PDFNavagationBarWidth - _rightButton.imageView.image.size.width) / 2 ];
    
//    [self.view addSubview:self.collectionView];
    
    FootballTeamHeaderView *headerView = [[FootballTeamHeaderView alloc] init];
    headerView.frame = CGRectMake(0, 0, MAIN_WIDTH, HEIGHT_From_4_7(kBackgroundViewHeight));
    
    headerView.backgroundView.image = [UIImage imageNamed:@"MyCenterBackground"];
    headerView.playersLabel.text = @"11人";
    headerView.sitesLabel.text = @"22场";
    
    [self.view addSubview:headerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - EventResponse
- (void)rightButtonHandle:(UIButton *)sender {

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
        
//        [_collectionView registerClass:[DailyGoodsReusableView class]
//            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
//                   withReuseIdentifier:@"DailyGoodsReusableViewIdertifier"];
//        
//        [_collectionView registerClass:[DailyGoodsCell class]
//            forCellWithReuseIdentifier:@"DailyGoodsCellIdentifier"];
    }
    return _collectionView;
}


@end
