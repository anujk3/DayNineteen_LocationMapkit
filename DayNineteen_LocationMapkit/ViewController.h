//
//  ViewController.h
//  DayNineteen_LocationMapkit
//
//  Created by Anuj Katiyal on 02/10/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MyLocationController.h"

@interface ViewController : UIViewController <MKMapViewDelegate, MyLocationDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblLatitude;
@property (weak, nonatomic) IBOutlet UILabel *lblLongitude;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, retain) MyLocationController *locationController;

@end

