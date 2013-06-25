//
//  GeoLocationViewController.h
//  Finki-Informator
//
//  Created by Nikola Koevski on 6/25/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MyLocations.h"

@interface GeoLocationViewController : UIViewController
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UILabel *campusLabel;
@property (strong, nonatomic) NSArray *mapLocations;
@property (strong, nonatomic) NSArray *campusLocations;
@property (strong, nonatomic) PFObject *camp;
-(void)fillMap;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *refreshButton;
- (IBAction)btnRefreshClicked:(id)sender;
@end
