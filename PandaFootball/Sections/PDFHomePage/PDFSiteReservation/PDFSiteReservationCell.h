//
//  PDFSiteReservationCell.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/13.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SRCellReservationType) {
    SRCellReservationTypeEnable = 0,
    SRCellReservationTypeUnable
};

@interface PDFSiteReservationCell : UITableViewCell

@property (nonatomic, strong) UIImageView *siteImageView;
@property (nonatomic, strong) UILabel *siteNameLabel;
@property (nonatomic, strong) UILabel *siteAddressLabel;

@property (nonatomic, strong) UIButton *reservationButton;

@property (nonatomic, assign) SRCellReservationType reservationType;

@end
