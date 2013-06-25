//
//  DetailsController.m
//  Finki-Informator
//
//  Created by Vladimir Trajkovik on 6/19/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import "DetailsController.h"

@interface DetailsController ()

@end

@implementation DetailsController

@synthesize course;

@synthesize name;
@synthesize code;
@synthesize fondCas;
@synthesize tip;
@synthesize semester;
@synthesize credits;
@synthesize pdfUrl;

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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = [self.course objectForKey:@"subject"];
    [self.name setText:[NSString stringWithFormat:@"Име: %@",[self.course objectForKey:@"subject"]]];
    [self.code setText:[NSString stringWithFormat:@"Код: %@",[self.course objectForKey:@"code"]]];
    [self.fondCas setText:[NSString stringWithFormat:@"Фонд на часови: %@",[self.course objectForKey:@"fond_casovi"]]];
    [self.tip setText:[NSString stringWithFormat:@"Тип: %@",[self.course objectForKey:@"mandatory"]]];
    [self.semester setText:[NSString stringWithFormat:@"Семестар %@ - %@",[self.course objectForKey:@"semester"],[self.course objectForKey:@"subtitle"]]];
    int creds = [[self.course objectForKey:@"credits"] intValue];
    [self.credits setText:[NSString stringWithFormat:@"Кредити: %@",[NSString stringWithFormat:@"%d",creds]]];
        
    //Load web view data
    NSString *strWebsiteUlr = [self.course objectForKey:@"url"];
    
    // Load URL
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:strWebsiteUlr];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [self.pdfUrl loadRequest:requestObj];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
