//
//  UpisiRootController.h
//  Finki-Informator
//
//  Created by Dado on 6/26/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpisiRootController : UINavigationController

@property (strong, nonatomic) NSArray *list;
@property (strong, nonatomic) NSArray *nasoki;
- (IBAction)btnCellClicked:(id)sender;

- (void)pushToNavStack:(NSInteger)contr forRow:(NSInteger)row;
@end
