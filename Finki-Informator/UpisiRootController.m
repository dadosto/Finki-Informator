//
//  UpisiRootController.m
//  Finki-Informator
//
//  Created by Dado on 6/26/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import "UpisiRootController.h"
#import "PotrebniDokumentiController.h"
#import "PotrebniPredmetiController.h"
#import "UpisiPocetnaController.h"
#import "StipendiiController.h"

@interface UpisiRootController ()
@property (strong, nonatomic) UpisiPocetnaController *upisiPocetna;
@property (strong, nonatomic) PotrebniPredmetiController *potrebniPredmeti;
@property (strong, nonatomic) PotrebniDokumentiController *potrebniDokumenti;
@property (strong, nonatomic) StipendiiController *stipendii;
@end

@implementation UpisiRootController
@synthesize list;
@synthesize upisiPocetna;
@synthesize potrebniPredmeti;
@synthesize potrebniDokumenti;
@synthesize stipendii;
@synthesize data;

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
    self.title = @"Уписи";
    if (list == nil)
    {     
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects: @"Почетна",@"Потребни Предмети",@"Потребни Документи",@"Стипендии", nil];
        self.list = array;
    }
    
    if (self.data == nil)
    {
        NSMutableArray *niza = [[NSMutableArray alloc] initWithObjects:nil];
        
        //----------- KOD ZA ZEMANJE NA PODATOCI OD PARSE.COM -----------
        PFQuery *query = [PFQuery queryWithClassName:@"upisi"];
        //[query whereKey:@"type" equalTo:@"pocetna"];
        //[query whereKey:@"semester" equalTo:[NSString stringWithFormat:@"%d",self.numSemestar]];
        //[query f]
        [query findObjectsInBackgroundWithBlock:^(NSArray *courses, NSError *error)
         {
             if(!error)
             {
                 for(PFObject *course in courses)
                 {
                     //ZA proverka dali raboti -> RABOTI :)
                     //self.title = [course objectForKey:@"subject"];
                     NSString *a = [[course objectForKey:@"content"] stringByReplacingOccurrencesOfString: @"\\n" withString: @"\n"];
                     [niza addObject:a];

                 }
                 self.data=niza;
                 //[[self tableView] reloadData];
             }
             //NSArray *test = self.data;
             //[test removeAllObjects];
         }];
        //------------ PARSE.COM ---------------
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

- (void)pushToNavStack:(NSInteger) row
{
    if (data!=nil)
    {
    NSString *selectedRow = [list objectAtIndex:row];
    
    switch (row)
    {
        case 0:
        {
            if (upisiPocetna==nil)
                upisiPocetna = [[UpisiPocetnaController alloc] init];
            upisiPocetna.title = selectedRow;
            upisiPocetna.text = [data objectAtIndex:0];
            [self.navigationController pushViewController:upisiPocetna animated:YES];
            break;
        }
        case 1:
        {
            if (potrebniPredmeti==nil)
                potrebniPredmeti = [[PotrebniPredmetiController alloc] init];
            potrebniPredmeti.title = selectedRow;
            potrebniPredmeti.text = [data objectAtIndex:1];
            [self.navigationController pushViewController:potrebniPredmeti animated:YES];
            break;
        }
        case 2:
        {
            if (potrebniDokumenti==nil)
                potrebniDokumenti = [[PotrebniDokumentiController alloc] init];
            potrebniDokumenti.title = selectedRow;
            potrebniDokumenti.text = [data objectAtIndex:2];
            [self.navigationController pushViewController:potrebniDokumenti animated:YES];
            break;
        }
        case 3:
        {
            if (stipendii==nil)
                stipendii = [[StipendiiController alloc] init];
            stipendii.title = selectedRow;
            stipendii.text = [data objectAtIndex:3];
            [self.navigationController pushViewController:stipendii animated:YES];
            break;
        }

        default:break;
    }
    }
    
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
 {
 #warning Potentially incomplete method implementation.
 // Return the number of sections.
 return 1;
 }*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"UpisiRootCell";
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
    [self pushToNavStack:[indexPath row]];
}

@end
