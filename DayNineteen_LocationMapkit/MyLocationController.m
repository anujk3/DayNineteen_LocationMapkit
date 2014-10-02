//
//  MyLocationController.m
//  DayNineteen_LocationMapkit
//
//  Created by Anuj Katiyal on 25/09/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import "MyLocationController.h"

@implementation MyLocationController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        [_locationManager requestAlwaysAuthorization];
        [_locationManager requestWhenInUseAuthorization];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    [self.delegate update:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    [self.delegate locationError:error];
}

@end
