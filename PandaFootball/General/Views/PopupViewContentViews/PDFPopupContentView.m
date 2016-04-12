//
//  PDFPopupContentView.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/12.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFPopupContentView.h"
#import "PDFUIFormatMacros.h"

static const CGFloat kBottomButtonDefaultHeight         = 35.0f;

@interface PDFPopupContentView()

@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) UIButton *bottomButtonDefault;

@end

@implementation PDFPopupContentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = PDFColorWhite;
        
        self.selectedIndex = 0;
        
        [self addSubview:self.bottomButtonDefault];
        [self addSubview:self.bottomLineView];
        
    }
    return self;
}

#pragma mark - Setters
- (void)setDataSourceArray:(NSArray *)dataSourceArray {
    _dataSourceArray = dataSourceArray;
    
    
    for (int i = 0; i < _dataSourceArray.count; i++) {
        NSString *titleString = [_dataSourceArray objectAtIndex:i];
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        
        
        
        
        
        
        
        
//        TablePopupModel *model = [_dataSourceArray objectAtIndex:i];
//        
//        XQBTablePopupCell *cellView = [[XQBTablePopupCell alloc] init];
//        cellView.iconImage = model.iconImage;
//        cellView.titleString = model.title;
//        cellView.bottomLineIsFacing = model.bottomLineIsFacing;
//        cellView.tag = i;
//        
//        [cellView setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]
//                                                        size:CGSizeMake(1, AUTO_HEIGHT_FROM4_7(kContentCellHeight))]
//                            forState:UIControlStateNormal];
//        
//        [cellView setBackgroundImage:[UIImage imageWithColor:XQBColorBackground
//                                                        size:CGSizeMake(1, AUTO_HEIGHT_FROM4_7(kContentCellHeight))]
//                            forState:UIControlStateHighlighted];
//        
//        [cellView addTarget:self action:@selector(cellViewHandel:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [_contentView addSubview:cellView];
//        
//        [cellView makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(@(i * AUTO_HEIGHT_FROM4_7(kContentCellHeight)));
//            make.height.equalTo(@(AUTO_HEIGHT_FROM4_7(kContentCellHeight)));
//            make.left.equalTo(@0);
//            make.right.equalTo(@0);
//        }];
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    
    if (_selectedIndex < (int)self.subviews.count - 2) { //contentView 还有bottomButton子view
        for (int i = 0; i < (int)self.subviews.count - 2; i++) {
//            XQBTablePopupCell *cellView = [self.subviews objectAtIndex:i + 1];
//            
//            if (i == _selectedIndex) {
//                cellView.highlighted = YES;
//            }
//            else {
//                cellView.highlighted = NO;
//            }
        }
    }
}

- (void)setBottomButton:(UIButton *)bottomButton {
    _bottomButton = bottomButton;
}

#pragma mark - LazyLoading
- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.frame = CGRectMake(0, 0, MAIN_WIDTH, 0.5);
        
        _bottomLineView.backgroundColor = PDFColorLineSplit;
    }
    return _bottomLineView;
}

- (UIButton *)bottomButtonDefault {
    if (!_bottomButtonDefault) {
        _bottomButtonDefault = [UIButton buttonWithType:UIButtonTypeCustom];
        _bottomButtonDefault.frame = CGRectMake(0, 0, MAIN_WIDTH, kBottomButtonDefaultHeight);
        [_bottomButtonDefault setImage:[UIImage imageNamed:@"PopupViewSwitch.png"] forState:UIControlStateNormal];
    }
    return _bottomButtonDefault;
}

@end
