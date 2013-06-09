//
//  NasokaCell.h
//  Finki-Informator
//
//  Created by Dado on 5/22/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NasokaCell : UITableViewCell

@property NSInteger rowNumber;
@property NSInteger kopce;
@property (copy, nonatomic) NSString *nasoka;
@property (strong, nonatomic) IBOutlet UILabel *nasokaLabel;
@property (strong, nonatomic) IBOutlet UIButton *btnInfo;
@property (strong, nonatomic) IBOutlet UIButton *btnTitula;
@property (strong, nonatomic) IBOutlet UIButton *btnPredmeti;

-(IBAction)btnClicked:(id)sender;

@end
