//
//  NasokiController.h
//  Finki-Informator
//
//  Created by Dado on 5/21/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NasokiController : UITableViewController

@property (strong, nonatomic) NSArray *list;

- (IBAction)btnCellClicked:(id)sender;

- (void)pushToNavStack:(NSInteger)contr forRow:(NSInteger)row;

@end
