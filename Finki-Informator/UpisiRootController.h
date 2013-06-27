//
//  UpisiRootController.h
//  Finki-Informator
//
//  Created by Dado on 6/26/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface UpisiRootController : UITableViewController

@property (strong, nonatomic) NSArray *list;
@property (strong, nonatomic) NSArray *data;
/*@property (strong, nonatomic) NSString *str1;
@property (strong, nonatomic) NSString *str2;
@property (strong, nonatomic) NSString *str3;
@property (strong, nonatomic) NSString *str4;*/
- (void)pushToNavStack:(NSInteger)row;
@end
