//
//  DetailsController.h
//  Finki-Informator
//
//  Created by Vladimir Trajkovik on 6/19/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DetailsController : UIViewController

@property (strong, nonatomic) PFObject *course;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *code;
@property (strong, nonatomic) IBOutlet UILabel *fondCas;
@property (strong, nonatomic) IBOutlet UILabel *tip;
@property (strong, nonatomic) IBOutlet UILabel *semester;
@property (strong, nonatomic) IBOutlet UILabel *credits;
@property (strong, nonatomic) IBOutlet UIWebView *pdfUrl;

@end
	