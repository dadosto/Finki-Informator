//
//  NasokaCell.m
//  Finki-Informator
//
//  Created by Dado on 5/22/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import "NasokaCell.h"

@implementation NasokaCell
@synthesize rowNumber;
@synthesize kopce;
@synthesize nasoka;
@synthesize nasokaLabel;
@synthesize btnInfo;
@synthesize btnPredmeti;
@synthesize btnTitula;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    kopce=0;
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)btnClicked:(id)sender
{
    NSIndexPath *myIndexPath = [(UITableView *)self.superview indexPathForCell: self];
    rowNumber = myIndexPath.row;
    UIButton *btn = (UIButton *) sender;
    switch (btn.tag)
    {
        case 1: kopce=1; break;
        case 2: kopce=2; break;
        case 3: kopce=3; break;
        default: kopce=0;
    }
    
}

@end
