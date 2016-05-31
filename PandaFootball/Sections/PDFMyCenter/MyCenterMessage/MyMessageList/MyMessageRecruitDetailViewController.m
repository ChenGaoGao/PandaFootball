//
//  MyMessageRecruitDetailViewController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/5/31.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "MyMessageRecruitDetailViewController.h"
#import "PDFPCHMacro.h"

#import "PDFSpaceView.h"




static const CGFloat kHeaderBgButtonHeight      = 68.0f;
static const CGFloat kIconViewWidth             = 40.0f;
static const CGFloat kIconViewHeight            = 40.0f;
static const CGFloat kRightIconWidth            = 80.0f;
static const CGFloat kCellLabelHeight           = 50.0f;

@interface MyMessageRecruitDetailViewController ()

@property (nonatomic, strong) UIButton *headerBgButton;
@property (nonatomic, strong) UIImageView *headerIconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *addressLabel;

@property (nonatomic, strong) PDFSpaceView *spaceView;

@property (nonatomic, strong) UILabel *perPositionLabel;
@property (nonatomic, strong) UILabel *positionLabel;
@property (nonatomic, strong) UIView *lineView1;

@property (nonatomic, strong) UILabel *perTimeLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView *lineView2;

@property (nonatomic, strong) UIButton *passButton;
@property (nonatomic, strong) UIButton *refuseButton;

@end

@implementation MyMessageRecruitDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.headerBgButton];
    [self.headerBgButton addSubview:self.headerIconView];
    [self.headerBgButton addSubview:self.nameLabel];
    [self.headerBgButton addSubview:self.addressLabel];
    
    [self.view addSubview:self.spaceView];
    
    [self.view addSubview:self.perPositionLabel];
    [self.view addSubview:self.positionLabel];
    [self.view addSubview:self.lineView1];
    
    [self.view addSubview:self.perTimeLabel];
    [self.view addSubview:self.timeLabel];
    [self.view addSubview:self.lineView2];
    
    [self.view addSubview:self.passButton];
    [self.view addSubview:self.refuseButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LazyLoad
- (UIButton *)headerBgButton {
    if (!_headerBgButton) {
        _headerBgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _headerBgButton.frame = CGRectMake(0, 0, MAIN_WIDTH, kHeaderBgButtonHeight);
    }
    return _headerBgButton;
}

- (UIImageView *)headerIconView {
    if (!_headerIconView) {
        _headerIconView = [[UIImageView alloc] init];
        _headerIconView.frame = CGRectMake(PDFSpaceBigger, PDFSpaceSmallish, kIconViewWidth, kIconViewHeight);
        
        _headerIconView.clipsToBounds = YES;
        _headerIconView.contentMode = UIViewContentModeScaleAspectFill;
        
        _headerIconView.layer.borderWidth = 0.5;
        _headerIconView.layer.borderColor = PDFColorLineBorder.CGColor;
        _headerIconView.layer.cornerRadius = kIconViewWidth / 2;
    }
    return _headerIconView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(VIEW_RIGHT(_headerIconView) + PDFSpaceSmallest,
                                      VIEW_TOP(_headerIconView) + PDFSpaceSmaller / 2,
                                      MAIN_WIDTH - VIEW_RIGHT(_headerIconView) - PDFSpaceSmallest - PDFSpaceDefault * 2 - kRightIconWidth,
                                      PDFLabelHeightDetailBigger);
        
        _nameLabel.font = PDFFontDetailBigger;
        _nameLabel.textColor = PDFColorTextBodyDefault;
    }
    return _nameLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.frame = CGRectMake(VIEW_RIGHT(_headerIconView) + PDFSpaceSmallest,
                                      VIEW_BOTTOM(_nameLabel) + PDFSpaceSmallish / 2,
                                      VIEW_WIDTH(_nameLabel),
                                      PDFLabelHeightDetailSmaller);
        
        _addressLabel.font = PDFFontDetailSmaller;
        _addressLabel.textColor = PDFColorTextDetailDefault;
    }
    return _addressLabel;
}

- (PDFSpaceView *)spaceView {
    if (!_spaceView) {
        _spaceView = [[PDFSpaceView alloc] init];
        _spaceView.frame = CGRectMake(0, kHeaderBgButtonHeight, MAIN_WIDTH, PDFSpaceSmallest);
    }
    return _spaceView;
}

@end
