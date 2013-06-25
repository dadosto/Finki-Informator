//
//  MyLocations.h
//  Finki-Informator
//
//  Created by Nikola Koevski on 6/25/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyLocation : NSObject <MKAnnotation>

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;
- (MKMapItem*)mapItem;

@end