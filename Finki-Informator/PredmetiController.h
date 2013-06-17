//
//  PredmetiController.h
//  Finki-Informator
//
//  Created by Dado on 6/12/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface PredmetiController : UITableViewController
@property (strong, nonatomic) NSMutableArray *list;
@property (strong, nonatomic) NSString *nasoka;
@property NSInteger numSemestar;

@end
