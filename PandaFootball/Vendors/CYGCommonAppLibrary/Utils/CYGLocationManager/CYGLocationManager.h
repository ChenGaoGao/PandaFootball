//
//  CYGLocationManager.h
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/12.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@class CYGLocationManager;

@protocol CYGLocationManagerDelegate<NSObject>

@optional
- (void)cygLocationManager:(CYGLocationManager *)manager locationSuccessWithLocations:(CLLocation *)locations;
- (void)cygLocationManager:(CYGLocationManager *)manager locationFailWithError:(NSError *)error;
- (void)cygLocationManager:(CYGLocationManager *)manager searchGeocodeSuccessWithCityName:(NSString *)cityName;
- (void)cygLocationManager:(CYGLocationManager *)manager searchGeocodeFailWithError:(NSError *)error;

@end

@interface CYGLocationManager : NSObject

+ (instancetype)shareInstance;

@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;    /**< 经纬度 */

@property (nonatomic, assign) BOOL locationIsSuccess;

@property (nonatomic, weak) id <CYGLocationManagerDelegate> delegate;

- (void)relocation;

@end
