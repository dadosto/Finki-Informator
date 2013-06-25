//
//  GeoLocationViewController.m
//  Finki-Informator
//
//  Created by Nikola Koevski on 6/25/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import "GeoLocationViewController.h"

@interface GeoLocationViewController ()

@end

@implementation GeoLocationViewController

@synthesize mapView;
@synthesize mapLocations;
@synthesize campusLocations;
@synthesize camp;
@synthesize campusLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fillMap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fillMap{
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        if(!error){
            PFQuery *query = [PFQuery queryWithClassName:@"campus"];
            [query whereKey:@"location" nearGeoPoint:geoPoint];
            query.limit = 2;
            self.camp = [query findObjects][0];
            
            [self.campusLabel setText:[NSString stringWithFormat:@"Места за јадење близу %@", [self.camp objectForKey:@"campus"]]];
            
            PFQuery *placesQuery = [PFQuery queryWithClassName:@"places"];
            [placesQuery whereKey:@"near" equalTo:[self.camp objectForKey:@"key"]];
            [placesQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                if(!error){
                    for (PFObject *place in objects){
                        double ltd = [[place objectForKey:@"location"] latitude];
                        double lgt = [[place objectForKey:@"location"] longitude];
                        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(ltd, lgt);
                        NSString *name = [place objectForKey:@"name"];
                        NSString *address = [self.camp objectForKey:@"campus"];
                        
                        MyLocation *annotation = [[MyLocation alloc] initWithName:name address:address coordinate:coord];
                        [self.mapView addAnnotation:annotation];
                    }
                }
            }];
            
            double lat = [[self.camp objectForKey:@"location"] latitude];
            double lng = [[self.camp objectForKey:@"location"] longitude];
            
            CLLocationCoordinate2D zoomLocation = CLLocationCoordinate2DMake(lat, lng);
            
            MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 2000, 2000);
            
            [self.mapView setRegion:viewRegion animated:YES];
        }
    }];
}

- (IBAction)btnRefreshClicked:(id)sender{
    [self fillMap];
}

@end
