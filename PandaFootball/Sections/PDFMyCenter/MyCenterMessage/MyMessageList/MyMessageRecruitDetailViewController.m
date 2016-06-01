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
static const CGFloat kRightIconWidth            = 8.0f;
static const CGFloat kRightIconHeight           = 13.0f;
static const CGFloat kItemViewHeight            = 50.0f;
static const CGFloat kPerLabelWidth             = 90.0f;

@interface MyMessageRecruitDetailViewController ()

@property (nonatomic, strong) UIButton *headerBgButton;
@property (nonatomic, strong) UIImageView *headerIconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UIImageView *rightIconView;

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
    [self setLeftBarButton];
    [self setNavigationTitleWhite:@"审核详情"];
    
    
    [self.view addSubview:self.headerBgButton];
    [self.headerBgButton addSubview:self.headerIconView];
    [self.headerBgButton addSubview:self.nameLabel];
    [self.headerBgButton addSubview:self.addressLabel];
    [self.headerBgButton addSubview:self.rightIconView];
    
    [self.view addSubview:self.spaceView];
    
    [self.view addSubview:self.perPositionLabel];
    [self.view addSubview:self.positionLabel];
    [self.view addSubview:self.lineView1];
    
    [self.view addSubview:self.perTimeLabel];
    [self.view addSubview:self.timeLabel];
    [self.view addSubview:self.lineView2];
    
    [self.view addSubview:self.passButton];
    [self.view addSubview:self.refuseButton];
    
    [self refreshUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Method
- (void)refreshUI {
    self.headerIconView.image = [UIImage imageNamed:@"MyCenterBackground"];
    self.nameLabel.text = @"奔跑的汉子";
    self.addressLabel.text = @"深圳南山区";
    
    self.positionLabel.text = @"帝王物业－管理";
    self.timeLabel.text = @"2016-03-22 09:00";
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

- (UIImageView *)rightIconView {
    if (!_rightIconView) {
        _rightIconView = [[UIImageView alloc] init];
        _rightIconView.frame = CGRectMake(MAIN_WIDTH - kRightIconWidth - PDFSpaceBigger,
                                          (kHeaderBgButtonHeight - kRightIconHeight) / 2,
                                          kRightIconWidth,
                                          kRightIconHeight);
        
        _rightIconView.image = [UIImage imageNamed:@"PublicGoto"];
    }
    return _rightIconView;
}

- (PDFSpaceView *)spaceView {
    if (!_spaceView) {
        _spaceView = [[PDFSpaceView alloc] init];
        _spaceView.frame = CGRectMake(0, kHeaderBgButtonHeight, MAIN_WIDTH, PDFSpaceSmallest);
    }
    return _spaceView;
}

- (UILabel *)perPositionLabel {
    if (!_perPositionLabel) {
        _perPositionLabel = [[UILabel alloc] init];
        _perPositionLabel.frame = CGRectMake(PDFSpaceDefault,
                                             VIEW_BOTTOM(_spaceView),
                                             kPerLabelWidth,
                                             kItemViewHeight);
        
        _perPositionLabel.font = PDFFontDetailBigger;
        _perPositionLabel.text = @"申请位置";
        _perPositionLabel.textColor = PDFColorTextDetailDefault;
    }
    return _perPositionLabel;
}

- (UILabel *)positionLabel {
    if (!_positionLabel) {
        _positionLabel = [[UILabel alloc] init];
        _positionLabel.frame = CGRectMake(PDFSpaceDefault + kPerLabelWidth,
                                          VIEW_TOP(_perPositionLabel),
                                          MAIN_WIDTH - PDFSpaceDefault - kPerLabelWidth - PDFSpaceBigger,
                                          kItemViewHeight);
        
        _positionLabel.font = PDFFontBodySmaller;
        _positionLabel.textColor = PDFColorOrange;
        _positionLabel.textAlignment = NSTextAlignmentRight;
    }
    return _positionLabel;
}

- (UIView *)lineView1 {
    if (!_lineView1) {
        _lineView1 = [[UIView alloc] init];
        _lineView1.frame = CGRectMake(0, VIEW_BOTTOM(_perPositionLabel) - 0.5, MAIN_WIDTH, 0.5);
        _lineView1.backgroundColor = PDFColorLineSplit;
    }
    return _lineView1;
}

- (UILabel *)perTimeLabel {
    if (!_perTimeLabel) {
        _perTimeLabel = [[UILabel alloc] init];
        _perTimeLabel.frame = CGRectMake(PDFSpaceDefault,
                                         VIEW_BOTTOM(_lineView1),
                                         kPerLabelWidth,
                                         kItemViewHeight);
        
        _perTimeLabel.font = PDFFontDetailBigger;
        _perTimeLabel.text = @"申请时间";
        _perTimeLabel.textColor = PDFColorTextDetailDefault;
    }
    return _perTimeLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.frame = CGRectMake(PDFSpaceDefault + kPerLabelWidth,
                                      VIEW_TOP(_perTimeLabel),
                                      MAIN_WIDTH - PDFSpaceDefault - kPerLabelWidth - PDFSpaceBigger,
                                      kItemViewHeight);
        
        _timeLabel.font = PDFFontBodySmaller;
        _timeLabel.textColor = PDFColorTextBodyDefault;
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

- (UIView *)lineView2 {
    if (!_lineView2) {
        _lineView2 = [[UIView alloc] init];
        _lineView2.frame = CGRectMake(0, VIEW_BOTTOM(_perTimeLabel) - 0.5, MAIN_WIDTH, 0.5);
        _lineView2.backgroundColor = PDFColorLineSplit;
    }
    return _lineView2;
}

- (UIButton *)passButton {
    if (!_passButton) {
        _passButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _passButton.frame = CGRectMake(PDFSpaceBiggest,
                                       MAIN_HEIGHT - kItemViewHeight * 2 - PDFSpaceBiggish * 2,
                                       MAIN_WIDTH - PDFSpaceBiggest * 2,
                                       kItemViewHeight);
        
        [_passButton setTitle:@"通过" forState:UIControlStateNormal];
        [_passButton setTitleColor:PDFColorWhite forState:UIControlStateNormal];
        [_passButton setBackgroundColor:PDFColorGreen];
        [_passButton.titleLabel setFont:PDFFontBodyDefault];
        
        _passButton.clipsToBounds = YES;
        _passButton.layer.borderWidth = 0.0;
        _passButton.layer.borderColor = PDFColorGreen.CGColor;
        _passButton.layer.cornerRadius = kItemViewHeight / 2;
    }
    return _passButton;
}

- (UIButton *)refuseButton {
    if (!_refuseButton) {
        _refuseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _refuseButton.frame = CGRectMake(PDFSpaceBiggest,
                                         MAIN_HEIGHT - kItemViewHeight - PDFSpaceBiggish,
                                         MAIN_WIDTH - PDFSpaceBiggest * 2,
                                         kItemViewHeight);
        
        [_refuseButton setTitle:@"拒绝" forState:UIControlStateNormal];
        [_refuseButton setTitleColor:PDFColorWhite forState:UIControlStateNormal];
        [_refuseButton setBackgroundColor:PDFColorOrange];
        [_refuseButton.titleLabel setFont:PDFFontBodyDefault];
        
        _refuseButton.clipsToBounds = YES;
        _refuseButton.layer.borderWidth = 0.0;
        _refuseButton.layer.borderColor = PDFColorOrange.CGColor;
        _refuseButton.layer.cornerRadius = kItemViewHeight / 2;
    }
    return _refuseButton;
}

@end
