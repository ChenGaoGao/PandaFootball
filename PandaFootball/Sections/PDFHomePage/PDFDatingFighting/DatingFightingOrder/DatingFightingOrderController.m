//
//  DatingFightingOrderController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/6.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "DatingFightingOrderController.h"
#import "PDFPCHMacro.h"

#import "PDFSpaceView.h"
#import "SROConfirmView.h"



static const CGFloat kConfirmViewHeight             = 50.0f;
static const CGFloat kIconViewWidth                 = 70.0f;

@interface DatingFightingOrderController ()



@property (nonatomic, strong) UIImageView *hostIconView;
@property (nonatomic, strong) UILabel *hostNameLabel;
@property (nonatomic, strong) UIImageView *guestIconView;
@property (nonatomic, strong) UILabel *guestNameLabel;
@property (nonatomic, strong) UILabel *versusLabel;             //VS

@property (nonatomic, strong) PDFSpaceView *spaceView;
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UILabel *siteLabe;                //场地

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) SROConfirmView *confirmView;      //跟订场一样的，先用着

@end

@implementation DatingFightingOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitleWhite:@"约战订单"];
    [self setLeftBarButton];
    
    [self.view addSubview:self.hostIconView];
    [self.view addSubview:self.hostNameLabel];
    [self.view addSubview:self.guestIconView];
    [self.view addSubview:self.guestNameLabel];
    [self.view addSubview:self.versusLabel];
    
    [self.view addSubview:self.spaceView];
    [self.view addSubview:self.typeLabel];
    [self.view addSubview:self.timeLabel];
    [self.view addSubview:self.phoneLabel];
    [self.view addSubview:self.siteLabe];
    
    [self.view addSubview:self.confirmView];
    
    [self refreshUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Refresh
- (void)refreshUI {
    _hostIconView.image = [UIImage imageNamed:@"MyCenterBackground"];
    _hostNameLabel.text = @"星月队";
    _guestIconView.image = [UIImage imageNamed:@"MyCenterBackground"];
    _guestNameLabel.text = @"铠甲勇士";
    
}

#pragma mark - LazyLoad
- (UIImageView *)hostIconView {
    if (!_hostIconView) {
        _hostIconView = [[UIImageView alloc] init];
        _hostIconView.frame = CGRectMake(PDFSpaceBigger * 2, PDFSpaceBigger, kIconViewWidth, kIconViewWidth);
        
        _hostIconView.clipsToBounds = YES;
        _hostIconView.layer.borderWidth = 0.5;
        _hostIconView.layer.borderColor = PDFColorLineBorder.CGColor;
        _hostIconView.layer.cornerRadius = kIconViewWidth / 2;
    }
    return _hostIconView;
}

- (UILabel *)hostNameLabel {
    if (!_hostNameLabel) {
        _hostNameLabel = [[UILabel alloc] init];
        _hostNameLabel.frame = CGRectMake(VIEW_LEFT(_hostNameLabel) - PDFSpaceBigger,
                                          VIEW_BOTTOM(_hostNameLabel) + PDFSpaceSmallest,
                                          VIEW_WIDTH(_hostNameLabel) + PDFSpaceBigger * 2,
                                          PDFLabelHeightDetailBigger);
        
        _hostNameLabel.font = PDFFontDetailDefault;
        _hostNameLabel.textColor = PDFColorTextBodyLight;
        _hostNameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _hostNameLabel;
}

- (UIImageView *)guestIconView {
    if (!_guestIconView) {
        _guestIconView = [[UIImageView alloc] init];
        _guestIconView.frame = CGRectMake(MAIN_WIDTH - kIconViewWidth - PDFSpaceBigger * 2, PDFSpaceBigger,
                                          kIconViewWidth, kIconViewWidth);
        
        _guestIconView.clipsToBounds = YES;
        _guestIconView.layer.borderWidth = 0.5;
        _guestIconView.layer.borderColor = PDFColorLineBorder.CGColor;
        _guestIconView.layer.cornerRadius = kIconViewWidth / 2;
    }
    return _guestIconView;
}

- (UILabel *)guestNameLabel {
    if (!_guestNameLabel) {
        _guestNameLabel = [[UILabel alloc] init];
        _guestNameLabel.frame = CGRectMake(VIEW_LEFT(_guestIconView) - PDFSpaceBigger,
                                           VIEW_BOTTOM(_guestIconView) + PDFSpaceSmallest,
                                           VIEW_WIDTH(_guestIconView) + PDFSpaceBigger * 2,
                                           PDFLabelHeightDetailBigger);
        
        _guestNameLabel.font = PDFFontDetailDefault;
        _guestNameLabel.textColor = PDFColorTextBodyLight;
        _guestNameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _guestNameLabel;
}

- (UILabel *)versusLabel {
    if (!_versusLabel) {
        _versusLabel = [[UILabel alloc] init];
        _versusLabel.frame = CGRectMake(VIEW_RIGHT(_hostIconView) + PDFSpaceBigger,
                                        PDFSpaceBigger,
                                        VIEW_LEFT(_guestIconView) - PDFSpaceBigger * 2 - VIEW_RIGHT(_hostIconView),
                                        kIconViewWidth);
        
        _versusLabel.font = [UIFont boldSystemFontOfSize:26.0f];
        _versusLabel.text = @"VS";
        _versusLabel.textColor = PDFColorGreen;
        _versusLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _versusLabel;
}

- (PDFSpaceView *)spaceView {
    if (!_spaceView) {
        _spaceView = [[PDFSpaceView alloc] init];
        _spaceView.frame = CGRectMake(0, VIEW_BOTTOM(_hostNameLabel) + PDFSpaceBigger,
                                      MAIN_WIDTH, PDFSpaceSmallest);
    }
    return _spaceView;
}





- (SROConfirmView *)confirmView {
    if (!_confirmView) {
        _confirmView = [[SROConfirmView alloc] init];
        _confirmView.frame = CGRectMake(0, MAIN_HEIGHT - kConfirmViewHeight, MAIN_WIDTH, kConfirmViewHeight);
        
        _confirmView.costLabel.text = @"¥450.0";
    }
    return _confirmView;
}

@end
