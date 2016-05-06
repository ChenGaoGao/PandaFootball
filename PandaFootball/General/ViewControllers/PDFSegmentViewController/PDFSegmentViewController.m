//
//  PDFSegmentViewController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/28.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFSegmentViewController.h"
#import "PDFSegmentControl.h"
#import "PDFUIFormatMacros.h"

static const CGFloat kSegmentControlHeight          = 49.0f;

@interface PDFSegmentViewController () <PDFSegmentControlDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) PDFSegmentControl *segmentControl;
@property (nonatomic, strong) UIScrollView *contentScrollView;

@end

@implementation PDFSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.segmentControl];
    [self.view addSubview:self.contentScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)assignmentValueForUI {
    NSMutableArray *titleArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.segmentVCArray.count; i++) {
        [titleArray addObject:[self.segmentVCArray objectAtIndex:i].titleModel];
        
        UIViewController *viewController = [self.segmentVCArray objectAtIndex:i].viewController;
        
        [self addChildViewController:viewController];
        
        viewController.view.frame = CGRectMake(i * MAIN_WIDTH, 0, MAIN_WIDTH, VIEW_HEIGHT(self.contentScrollView));
        [self.contentScrollView addSubview:viewController.view];
    }
    
    self.segmentControl.titleArray = titleArray;
    self.contentScrollView.contentSize = CGSizeMake(self.segmentVCArray.count * MAIN_WIDTH, VIEW_HEIGHT(self.contentScrollView));
}

#pragma mark - PDFSegmentControlDelegate
- (void)segmentControl:(PDFSegmentControl *)contentView didSelectAtIndex:(NSInteger)index {
    [self.contentScrollView scrollRectToVisible:CGRectMake(VIEW_WIDTH(self.contentScrollView) * index,
                                                           VIEW_Y(self.contentScrollView),
                                                           VIEW_WIDTH(self.contentScrollView),
                                                           VIEW_HEIGHT(self.contentScrollView))
                                       animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x != 0) {
        self.segmentControl.selectedIndex = (scrollView.contentOffset.x + VIEW_WIDTH(scrollView) / 2) / VIEW_WIDTH(scrollView);
    }
    
    self.segmentControl.markView.frame = CGRectMake(scrollView.contentOffset.x *
                                                    VIEW_WIDTH(self.segmentControl.markView) / VIEW_WIDTH(scrollView),
                                                    VIEW_Y(self.segmentControl.markView),
                                                    VIEW_WIDTH(self.segmentControl.markView),
                                                    VIEW_HEIGHT(self.segmentControl.markView));
}

#pragma mark - Setters
- (void)setSegmentVCArray:(NSArray<PDFSegmentVCModel *> *)segmentVCArray {
    _segmentVCArray = segmentVCArray;
    
    [self assignmentValueForUI];
}

#pragma mark - LazyLoad
- (PDFSegmentControl *)segmentControl {
    if (!_segmentControl) {
        _segmentControl = [[PDFSegmentControl alloc] init];
        _segmentControl.frame = CGRectMake(0, 0, MAIN_WIDTH, kSegmentControlHeight);
        
        _segmentControl.m_delegate = self;
    }
    return _segmentControl;
}

- (UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] init];
        _contentScrollView.frame = CGRectMake(0, kSegmentControlHeight, MAIN_WIDTH, MAIN_HEIGHT - kSegmentControlHeight);
        
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.showsVerticalScrollIndicator = NO;
        _contentScrollView.delegate = self;
    }
    return _contentScrollView;
}
@end
