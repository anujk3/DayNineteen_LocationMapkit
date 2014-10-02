//
//  MyLocationController.h
//  DayNineteen_LocationMapkit
//
//  Created by Anuj Katiyal on 25/09/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol MyLocationDelegate <NSObject>

- (void)update:(CLLocation *)location;
- (void)locationError: (NSError *)error;

@end

@interface MyLocationController : NSObject <CLLocationManagerDelegate>

@property (nonatomic, retain) id <MyLocationDelegate> delegate;
@property (nonatomic, retain) CLLocationManager *locationManager;

@end
