//
//  GeoLocationViewController.h
//  Finki-Informator
//
//  Created by Vladimir Trajkovik on 6/19/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>

@interface GeoLocationViewController : UIViewController
@property (strong, nonatomic) IBOutlet MKMapView *foodMap;

@end
