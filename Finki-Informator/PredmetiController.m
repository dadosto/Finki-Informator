//
//  PredmetiController.m
//  Finki-Informator
//
//  Created by Dado on 6/12/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import "PredmetiController.h"

@interface PredmetiController ()

@end

@implementation PredmetiController

@synthesize list;
@synthesize nasoka;
@synthesize numSemestar;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.list == nil)
    {
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:nil];
        
        //----------- KOD ZA ZEMANJE NA PODATOCI OD PARSE.COM -----------
        PFQuery *query = [PFQuery queryWithClassName:@"predmeti"];
        [query whereKey:@"key" equalTo:self.nasoka];
        [query whereKey:@"semester" equalTo:[NSString stringWithFormat:@"%d",self.numSemestar]];
        
        [query findObjectsInBackgroundWithBlock:^(NSArray *courses, NSError *error)
         {
             if(!error)
             {
                 for(PFObject *course in courses)
                 {
                     //ZA proverka dali raboti -> RABOTI :)
                     //self.title = [course objectForKey:@"subject"];
                     [array addObject:[course objectForKey:@"subject"]];
                 }
                 self.list=array;
                 [[self tableView] reloadData];
             }
         }];
        //------------ PARSE.COM ---------------
        
        //self.list = array;
        
   }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SemestriCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    // Configure the cell....
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    NSUInteger row = [indexPath row];
    NSString *rowTitle = [list objectAtIndex:row];
    cell.textLabel.text = rowTitle;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
