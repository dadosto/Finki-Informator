//
//  StipendiiController.m
//  Finki-Informator
//
//  Created by Dado on 6/27/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import "StipendiiController.h"

@interface StipendiiController ()

@end

@implementation StipendiiController

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
    self.txtInfo.text= self.text;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
