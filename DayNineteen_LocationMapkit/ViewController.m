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
    
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    
    self.locationController = [[MyLocationController alloc]init];
    self.locationController.delegate = self;
    [self.locationController.locationManager startUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(10_9, 4_0){
    [self.locationController.locationManager startUpdatingLocation];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 4000 , 4000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
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

- (IBAction)tappedAdd:(id)sender {
    CLLocationCoordinate2D mapPoint;
    mapPoint.longitude = 72.856164;
    mapPoint.latitude = 19.017615;
    
    MKPointAnnotation *anny = [[MKPointAnnotation alloc] init];
    anny.coordinate = mapPoint;
    anny.title = @"Annotation description";
    anny.subtitle = @"Annotation subtitle";
    [self.mapView addAnnotation:anny];
}

- (IBAction)tappedRemove:(id)sender {
    for (id annotation in self.mapView.annotations)
        if (![annotation isKindOfClass:[MKUserLocation class]]) {
            [self.mapView removeAnnotation:annotation];
        }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    static NSString *AnnotationViewID = @"annotationViewID";
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
    }
    annotationView.canShowCallout = YES;
    annotationView.annotation = annotation;
    return annotationView;
}


@end
