//
//  ViewController.m
//  DayNineteen_LocationMapkit
//
//  Created by Anuj Katiyal on 02/10/14.
//  Copyright (c) 2014 Katiyals. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CLLocationManager *locationManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.locationController = [[MyLocationController alloc]init];
    self.locationController.delegate = self;
    [self.locationController.locationManager startUpdatingLocation];
    
    self.mapView.showsUserLocation = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(10_9, 4_0){
    [self.locationController.locationManager startUpdatingLocation];

}

- (void)update:(CLLocation *)location{
    NSLog(@"Location %@", location);
    self.lblLatitude.text= [NSString stringWithFormat:@"Latitude: %f", [location coordinate].latitude];
    self.lblLongitude.text = [NSString stringWithFormat:@"Longitude: %f", [location coordinate].longitude];
    [self.locationController.locationManager stopUpdatingLocation];
}

- (void)locationError: (NSError *)error{
    self.lblLatitude.text = [error description];
    self.lblLongitude.text = nil;
}

@end
