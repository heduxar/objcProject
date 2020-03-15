//
//  MapViewController.h
//  ObjcProject
//
//  Created by Юрий Султанов on 15.03.2020.
//  Copyright © 2020 Yuriy Sultanov. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : ViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) MKMapView * mapView;

@end

NS_ASSUME_NONNULL_END
