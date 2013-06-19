//
//  PredmetiController.m
//  Finki-Informator
//
//  Created by Dado on 6/12/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import "PredmetiController.h"
//#import <Social/Social.h>
//#import <Social/Social.h>
#import "Social/Social.h"

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

- (void)checkButtonTapped:(id)sender event:(id)event
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        UITableViewCell *clickedCell = (UITableViewCell *)[sender superview];
        NSString *str = [clickedCell textLabel].text;
        NSString *str2 = [@"Tweet za predmetot: #" stringByAppendingString:str];
        [tweetSheet setInitialText:str2];
        
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Greska!"
                                  message:@"Momentalno ne moze da se twita, najprvin mora da obezbedite internet konekcija i mora da postoi barem eden Twitter account na vasiot telefon"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }

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
        //[cell setBackgroundColor:[UIColor clearColor]];
    }
    
    // Configure the cell...
    
    
    /*UIButton *btnInfo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnInfo = [[UIButton alloc] initWithFrame:CGRectMake(75, 5, 70, 35)];
    UIImage *imgInfo = [UIImage imageNamed:@"info.png"];
    [btnInfo setBackgroundImage:whiteBg forState:UIControlStateNormal];
    [btnInfo setImage:imgInfo forState:UIControlStateNormal];*/
    
    
    //[btnInfo addTarget:self action:@selector(btnCellClicked:) forControlEvents:UIControlEventTouchUpInside];
    //[cell addSubview:btnInfo];
    
    UIImage *whiteBg = [UIImage imageNamed:@"white_bg"];
    
    UIButton *btnT = [UIButton buttonWithType:UIButtonTypeCustom];
    btnT = [[UIButton alloc] initWithFrame:CGRectMake(75, 5, 70, 35)];
    UIImage *imgT = [UIImage imageNamed:@"twitter_logo.jpeg"];
    [btnT setBackgroundImage:whiteBg forState:UIControlStateNormal];
    [btnT setImage:imgT forState:UIControlStateNormal];
    //[btnInfo setImage:[NSString stringWithFormat:@"brick-1.png"]];
    //btnT.tag=1;
    [btnT addTarget:self action:@selector(checkButtonTapped:event:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView = btnT;
    
    /*UIImage *image = [UIImage imageNamed:@"twitter_logo.jpeg"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    button.frame = frame;   // match the button's size with the image size
    
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnCellClicked:event:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor clearColor];
    cell.accessoryView = button;*/
    
    NSUInteger row = [indexPath row];
    NSString *rowTitle = [list objectAtIndex:row];
    cell.textLabel.text = rowTitle;
    //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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

/*- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if (childController == nil) {
        childController = [[BIDDisclosureDetailController alloc]
                           initWithNibName:@"BIDDisclosureDetail" bundle:nil];
    }
    childController.title = @"Disclosure Button Pressed"; NSUInteger row = [indexPath row];
    NSString *selectedMovie = [list objectAtIndex:row]; NSString *detailMessage = [[NSString alloc]
                                                                                   initWithFormat:@"You pressed the disclosure button for %@.",
                                                                                   selectedMovie];
    childController.message = detailMessage; childController.title = selectedMovie; [self.navigationController pushViewController:childController animated:YES];
}*/

	

@end
