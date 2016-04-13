//
//  PDFBaseMyCenterController.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/13.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "PDFBaseMyCenterController.h"
#import "PDFUIFormatMacros.h"
#import "UIImage+ImageEffects.h"

@interface PDFBaseMyCenterController () <UIScrollViewDelegate, UITableViewDelegate>

@property (nonatomic, strong) UIImageView *topBackgroundView;

@end

@implementation PDFBaseMyCenterController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _topBackgroundViewHeight = HEIGHT_From_4_7(180);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setNavigationTitleBlank:@" "];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.topBackgroundView];
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self setStatusBarWhite];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    
    if (offsetY > _topBackgroundViewHeight - STATUS_NAV_BAR_HEIGHT) {
        _topBackgroundView.frame = CGRectMake(0,
                                              -_topBackgroundViewHeight + STATUS_NAV_BAR_HEIGHT,
                                              VIEW_WIDTH(self.view),
                                              _topBackgroundViewHeight);
    }
    else if (offsetY > 0) {
        _topBackgroundView.frame = CGRectMake(0,
                                              -offsetY,
                                              VIEW_WIDTH(self.view),
                                              _topBackgroundViewHeight);
    } else {
        _topBackgroundView.frame = CGRectMake(0,
                                              0,
                                              VIEW_WIDTH(self.view),
                                              _topBackgroundViewHeight - 2 * offsetY);
    }
}

#pragma mark - setters
- (void)setTopBackgroundViewHeight:(CGFloat)topBackgroundViewHeight {
    _topBackgroundViewHeight = topBackgroundViewHeight;
    
    _topBackgroundView.frame = CGRectMake(0,
                                          0,
                                          VIEW_WIDTH(self.view),
                                          _topBackgroundViewHeight);
    
    _tableViewHeader.frame = CGRectMake(0,
                                        0,
                                        VIEW_WIDTH(self.view),
                                        _topBackgroundViewHeight - STATUS_NAV_BAR_HEIGHT);;
    [self.tableView setTableHeaderView:_tableViewHeader];
}

- (void)setTopBackgroundViewImageUrl:(NSURL *)topBackgroundViewImageUrl {
    _topBackgroundViewImageUrl = topBackgroundViewImageUrl;
    
//    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:_topBackgroundViewImageUrl
//                                                          options:SDWebImageDownloaderLowPriority
//                                                         progress:nil
//                                                        completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//                                                            if (error) {
//                                                                self.topBackgroundView.image = [[UIImage imageNamed:@"xqb_head_background_default"]
//                                                                                                blurImageBlackAlpha:0.26];
//                                                            }
//                                                            else {
//                                                                self.topBackgroundView.image = [image blurImageBlackAlpha:0.26];
//                                                            }
//                                                        }];
}

#pragma mark - getters and setters
- (UIImageView *)topBackgroundView {
    if (!_topBackgroundView) {
        _topBackgroundView = [[UIImageView alloc] init];
        _topBackgroundView.clipsToBounds = YES;
        _topBackgroundView.frame = CGRectMake(0,
                                              0,
                                              VIEW_WIDTH(self.view),
                                              _topBackgroundViewHeight);
        
        _topBackgroundView.contentMode = UIViewContentModeScaleAspectFill;
        _topBackgroundView.image = [[UIImage imageNamed:@"MyCenterBackground.png"]
                                    blurImageBlackAlpha:0.26];
    }
    return _topBackgroundView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STATUS_NAV_BAR_HEIGHT, VIEW_WIDTH(self.view), VIEW_HEIGHT(self.view) - STATUS_NAV_BAR_HEIGHT)
                                                  style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.tableHeaderView = self.tableViewHeader;
        _tableView.tableHeaderView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
    }
    return _tableView;
}

- (UIView *)tableViewHeader {
    if (!_tableViewHeader) {
        _tableViewHeader = [[UIView alloc] init];
        _tableViewHeader.frame = CGRectMake(0, 0, VIEW_WIDTH(self.view), _topBackgroundViewHeight - STATUS_NAV_BAR_HEIGHT);
    }
    return _tableViewHeader;
}
@end
