//
//  SemestriController.m
//  Finki-Informator
//
//  Created by Dado on 5/22/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import "SemestriController.h"
#import "PredmetiController.h"

@interface SemestriController ()

@end

@implementation SemestriController
@synthesize list;
@synthesize nasoka;

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

    
    if (list == nil)
    {
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects: @"1 Семестар",@"2 Семестар",@"3 Семестар",@"4 Семестар", @"5 Семестар",@"6 Семестар",@"7 Семестар",@"8 Семестар", nil];
        self.list = array;
    }
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
     PredmetiController *CoursesController = [[PredmetiController alloc] initWithStyle:UITableViewStylePlain];
    
    CoursesController.title = [NSString stringWithFormat:@"Семестар %d", indexPath.item +1];
    CoursesController.nasoka = self.nasoka;
    CoursesController.numSemestar = indexPath.item +1;
    
    [self.navigationController pushViewController:CoursesController animated:YES];
    
}

@end
