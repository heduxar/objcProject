//
//  MapViewController.m
//  ObjcProject
//
//  Created by Юрий Султанов on 15.03.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import "MapViewController.h"
#import "LocationService.h"

@interface MapViewController ()
@property (nonatomic, strong) LocationService *locationService;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CLLocationCoordinate2D coordinates = CLLocationCoordinate2DMake(57.150972, 65.537965);
    [self createMap];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateCurrentLocation:) name:kLocationServiceDidUpdateCurrentLocation object:nil];
    [self addPointToMapWithCoordinates:&coordinates];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)updateCurrentLocation:(NSNotification *)notification {
    CLLocation *currentLocation = notification.object;
    if (currentLocation) {
        MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
        MKCoordinateRegion region = MKCoordinateRegionMake(currentLocation.coordinate, span);
        [_mapView setRegion:region animated:YES];
    }
    
//    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(currentLocation.coordinate, 5000, 5000);
//    [_mapView setRegion: region animated: YES];
}


- (void)createMap {
    _mapView = [[MKMapView alloc] initWithFrame: self.view.bounds];
    [_mapView setDelegate:self];
    [_mapView setShowsUserLocation:YES];
    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    [self.view addSubview:_mapView];
}

- (void)addPointToMapWithCoordinates: (CLLocationCoordinate2D *) coordinates {
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = @"Цветной бульвар";
    annotation.subtitle = @"Парковая зона";
    annotation.coordinate = *(coordinates);
    [_mapView addAnnotation:annotation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *identifier = @"MarkerIdentifier";
    MKMarkerAnnotationView *annotationView = (MKMarkerAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView) {
        annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
        annotationView.calloutOffset = CGPointMake(0.0, 10.0);
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    annotationView.annotation = annotation;
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    CLLocationCoordinate2D coord = [[[_mapView selectedAnnotations] objectAtIndex:0] coordinate];
    NSLog(@"Point at \nLat: %f, \nLon: %f", coord.latitude, coord.longitude);
}

- (void)addressFromLocation:(CLLocation *)location {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"%@", placemark.name);
            }
        }
    }];
}

- (void)locationFromAddress:(NSString *)address {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0) {
            for (MKPlacemark *placemark in placemarks) {
                NSLog(@"%@", placemark.location);
            }
        }
    }];
}

@end
