//
//  UpisiRootController.m
//  Finki-Informator
//
//  Created by Dado on 6/26/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import "UpisiRootController.h"

@interface UpisiRootController ()
@property (strong, nonatomic) InfoController *childController1;
@property (strong, nonatomic) TitulaController *childController2;
@property (strong, nonatomic) SemestriController *childController3;
@end

@implementation UpisiRootController
@synthesize list;
@synthesize nasoki;
@synthesize childController1;
@synthesize childController2;
@synthesize childController3;
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
