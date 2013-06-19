//
//  TitulaController.m
//  Finki-Informator
//
//  Created by Dado on 5/22/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import "TitulaController.h"

@interface TitulaController ()

@end

@implementation TitulaController
@synthesize txtInfo;
@synthesize list;
@synthesize selektiranSemestar;
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
    if (list == nil)
    {
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:
                                 @"Титула:\n\n\tДипломиран инженер по електротехника и информациски технологии - специјалност: Информатика и компјутерско инженерство\n\nВреметраење: 4 години (8 семестри)",
                                 @"Титула:\n\n\tДипломиран инженер по информатика\n\nВреметраење: 3 години (6 семестри)",
                                 @"Титула: (според соодветната насока)\n\nДипломиран инженер по информатика – модул Компјутерски науки\nДипломиран инженер по информатика - модул Информациски системи\nДипломиран инженер по информатика - модул Програмско инженерство\nДипломиран инженер по информатика - модул Компјутерски архитектури и мрежи \n\nВреметраење: 4 години (8 семестри)",
                                 @"Титула: (според соодветниот модул)\n\n\tДипломиран инженер по информатички технологии - модул Интернет и мобилни технологии\nДипломиран инженер по информатички технологии – модул Администрирање на компјутерски мрежи\n\nВреметраење: 3 години (6 семестри)",
                                 @"Титула:\n\n\tДипломиран инженер по информатички науки (Bachelor of Science), насока: Компјутерски науки и инженерство",
                                 @"Титула:\n\n\tДипломиран инженер по информатички науки (Bachelor of Science), Насока: Мрежни технологии",
                                 @"Титула:\n\n\tДипломиран инженер по информатички науки (Bachelor of Science), насока: Примена на е-технологии",
                                 @"Титула:\n\n\tДипломиран професор по Информатика\n\nВреметраење: 4 години (8 семестри)",
                                 nil];
        self.list = array;
    }
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    txtInfo.text=@"";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    txtInfo.text=[list objectAtIndex:selektiranSemestar];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
