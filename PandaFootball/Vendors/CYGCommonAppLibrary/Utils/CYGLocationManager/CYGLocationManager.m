//
//  CYGLocationManager.m
//  PandaFootball
//
//  Created by Oliver Chen on 16/4/12.
//  Copyright © 2016年 myjoy. All rights reserved.
//

#import "CYGLocationManager.h"


static NSString *const kLocationCityName  = @"cyg_location_cityname";  /**< 城市名 */
static NSString *const kLocationLatitude  = @"cyg_location_latitude";  /**< 纬度 */
static NSString *const kLocationLongitude = @"cyg_location_longitude"; /**< 经度 */


@interface CYGLocationManager() <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, assign) BOOL locationIsArrived;

@end


@implementation CYGLocationManager

+ (instancetype)shareInstance{
    
    static CYGLocationManager *instance = nil;
    if (instance == nil) {
        instance = [[CYGLocationManager alloc] init];
    }
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        self.cityName = [userDefaults objectForKey:kLocationCityName];
        self.coordinate = CLLocationCoordinate2DMake([[userDefaults objectForKey:kLocationLatitude] doubleValue],
                                                     [[userDefaults objectForKey:kLocationLongitude] doubleValue]);
        if (_cityName.length == 0) {
            self.cityName = @"";
//            //设置默认城市，这里为深圳
//            self.cityName = @"深圳";
//            self.coordinate = CLLocationCoordinate2DMake(22.548839f, 114.050742f);
        }
        
        self.locationIsSuccess = NO;
        self.locationIsArrived = NO;
        
        [self setupLocationManager];
    }
    
    return self;
}

- (void)relocation {
    self.locationIsSuccess = NO;
    self.locationIsArrived = NO;
    [_locationManager startUpdatingLocation];
}

#pragma mark - private methods
- (void)setupLocationManager {
    self.locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    
    if ([CLLocationManager locationServicesEnabled]) {
        NSLog( @"Starting CLLocationManager" );
        
        _locationManager.distanceFilter = 200;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    else {
        NSLog( @"Cannot Starting CLLocationManager" );
    }
}

- (void)searchGeocode:(CLLocation *)location {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location
                   completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks,
                                       NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSString *city = placemark.locality;
            NSString *administrativeArea = placemark.administrativeArea;
            
            self.cityName = city.length == 0 ? administrativeArea : city;
            
            if ([_cityName hasPrefix:@"市"]) {
                NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"市"];
                self.cityName = [_cityName stringByTrimmingCharactersInSet:characterSet];
            }
            
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            
            [userDefault setObject:_cityName forKey:kLocationCityName];
            [userDefault setObject:[NSNumber numberWithDouble:_coordinate.latitude] forKey:kLocationLatitude];
            [userDefault setObject:[NSNumber numberWithDouble:_coordinate.longitude] forKey:kLocationLongitude];
            
            [NSUserDefaults resetStandardUserDefaults];
            
            
            
            self.locationIsSuccess = YES;
            
            if ([self.delegate respondsToSelector:@selector(cygLocationManager:searchGeocodeSuccessWithCityName:)]) {
                [self.delegate cygLocationManager:self searchGeocodeSuccessWithCityName:_cityName];
            }
        }
        else {
            self.locationIsSuccess = NO;
            
            if ([self.delegate respondsToSelector:@selector(cygLocationManager:searchGeocodeFailWithError:)]) {
                [self.delegate cygLocationManager:self searchGeocodeFailWithError:error];
            }
        }
    }];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    //ios8 以后都要用到requestWhenInUseAuthorization这个请求定位
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }
    [_locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [_locationManager stopUpdatingLocation];
    NSLog(@"location success");
    
    if (_locationIsArrived) {
        return;
    }
    self.locationIsArrived = YES;
    
    CLLocation *currentLoction = [locations lastObject];
    self.coordinate = currentLoction.coordinate;
    
    if ([self.delegate respondsToSelector:@selector(cygLocationManager:locationSuccessWithLocations:)]) {
        [self.delegate cygLocationManager:self locationSuccessWithLocations:currentLoction];
    }
    
    [self searchGeocode:currentLoction];
}

- (void)locationManager: (CLLocationManager *)manager
       didFailWithError: (NSError *)error {
    NSLog(@"location fail");
    self.locationIsSuccess = NO;
    
    [manager stopUpdatingLocation];
    switch([error code]) {
        case kCLErrorLocationUnknown: {
            //Probably temporary...
            NSLog(@"Location data unavailable");
            break;
        }
        case kCLErrorDenied: {
            //Access denied by user
            NSLog(@"Access to Location Services denied by user");
            break;
        }
        default:
            NSLog(@"An unknown error has occurred");
            break;
    }
    
    if ([self.delegate respondsToSelector:@selector(cygLocationManager: locationFailWithError:)]) {
        [self.delegate cygLocationManager:self locationFailWithError:error];
    }
}

@end
