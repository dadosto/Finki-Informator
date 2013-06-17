//
//  NasokiController.m
//  Finki-Informator
//
//  Created by Dado on 5/21/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import "NasokiController.h"
#import "SemestriController.h"
#import "NasokaCell.h"
#import "InfoController.h"
#import "TitulaController.h"


const int INFO = 1;
const int TITULA = 2;
const int SEMESTRI = 3;


@interface NasokiController ()
@property (strong, nonatomic) InfoController *childController1;
@property (strong, nonatomic) TitulaController *childController2;
@property (strong, nonatomic) SemestriController *childController3;
@end

@implementation NasokiController

static BOOL nibsRegistered = NO;

@synthesize list;
@synthesize childController1;
@synthesize childController2;
@synthesize childController3;

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
    self.title = @"Studiski Programi";
    if (list == nil)
    {
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects: @"IKI", @"INFO", @"ASI", @"PSIT", @"KNI", @"MT", @"PET", @"KE", nil];
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

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

- (void)pushToNavStack:(NSInteger)contr forRow: (NSInteger) row
{
    NSString *selektiranSmer = [list objectAtIndex:row];
    NSString *title = [[NSString alloc] initWithFormat:@"Informacii za %@", selektiranSmer];
    switch (contr)
    {
        case 1:
            if (childController1==nil)
                childController1 = [[InfoController alloc] init];
            childController1.title = title;
            childController1.lblInfo.text=title;
            [self.navigationController pushViewController:childController1 animated:YES];
            break;
        case 2:
            if (childController2==nil)
                childController2 = [[TitulaController alloc] init];
            childController2.title = title;
            childController2.lblTitula.text=title;
            [self.navigationController pushViewController:childController2 animated:YES];
            break;
        case 3:
            if (childController3==nil)
                childController3 = [[SemestriController alloc] initWithStyle:UITableViewStylePlain];
            childController3.title = title;
            [self.navigationController pushViewController:childController3 animated:YES];
            break;
        default:break;
    }
}


- (IBAction)btnCellClicked:(id)sender
{
    UIButton *btnClicked = (UIButton *)sender;
    NSInteger tag =btnClicked.tag;
    UITableViewCell *clickedCell = (UITableViewCell *)[sender superview];
    NSIndexPath *clickedButtonPath = [self.tableView indexPathForCell:clickedCell];
    NSInteger row = clickedButtonPath.row;
    [self pushToNavStack:tag forRow:row];
    
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
    static NSString *CellIdentifier = @"SmerCell";
    
    
    if (!nibsRegistered)
    {
        UINib *nib = [UINib nibWithNibName:@"NasokaCell" bundle:nil];

        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        nibsRegistered = YES;
    }
    
    NasokaCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    /*if (cell == nil)
    {
        cell = [[NasokaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }*/
    
    // Configure the cell...
    
    /*UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.tag = indexPath.row;
    button1.titleLabel.tag = 0; // button #0 (or column 0)
    [button1 addTarget:self action:@selector(cellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:button1];*/
    UIImage *whiteBg = [UIImage imageNamed:@"white_bg"];
    
    UIButton *btnInfo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnInfo = [[UIButton alloc] initWithFrame:CGRectMake(75, 5, 70, 35)];
    UIImage *imgInfo = [UIImage imageNamed:@"info.png"];
    [btnInfo setBackgroundImage:whiteBg forState:UIControlStateNormal];
    [btnInfo setImage:imgInfo forState:UIControlStateNormal];
    //[btnInfo setImage:[NSString stringWithFormat:@"brick-1.png"]];
    btnInfo.tag=1;
    [btnInfo addTarget:self action:@selector(btnCellClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:btnInfo];
    
    UIButton *btnTitula = [UIButton buttonWithType:UIButtonTypeCustom];
    btnTitula = [[UIButton alloc] initWithFrame:CGRectMake(155, 5, 70, 35)];
    btnTitula.tag=2;
    UIImage *imgTitula = [UIImage imageNamed:@"titula.png"];
    [btnTitula setBackgroundImage:whiteBg forState:UIControlStateNormal];
    [btnTitula setImage:imgTitula forState:UIControlStateNormal];
    [btnTitula addTarget:self action:@selector(btnCellClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:btnTitula];
    
    UIButton *btnPredmeti = [UIButton buttonWithType:UIButtonTypeCustom];
    btnPredmeti = [[UIButton alloc] initWithFrame:CGRectMake(235, 5, 70, 35)];
    btnPredmeti.tag=3;
    UIImage *imgPredmeti = [UIImage imageNamed:@"predmeti.png"];
    [btnPredmeti setBackgroundImage:whiteBg forState:UIControlStateNormal];
    [btnPredmeti setImage:imgPredmeti forState:UIControlStateNormal];
    [btnPredmeti addTarget:self action:@selector(btnCellClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:btnPredmeti];

    
    /*[cell.btnInfo addTarget:self action:@selector(btnCellClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.btnPredmeti addTarget:self action:@selector(btnCellClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell.btnTitula addTarget:self action:@selector(btnCellClicked:) forControlEvents:UIControlEventTouchUpInside];*/
    
    NSUInteger row = [indexPath row];
    NSString *rowTitle = [list objectAtIndex:row];
    cell.nasokaLabel.text = rowTitle;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0; // Same number we used in Interface Builder
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
