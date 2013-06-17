//
//  InfoController.m
//  Finki-Informator
//
//  Created by Dado on 5/22/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import "InfoController.h"

@interface InfoController ()

@end

@implementation InfoController
@synthesize list;
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
                                 @"Студентите на оваа студиска програма се здобиваат со знаења кои им обезбедуваат голема професионална флексибилност и широк избор на работни места секаде каде постои потреба од проектирање, имплементација и одржување на информациско-комуникациски системи. Дипломираниот инженер од овој профил својата кариера може да ја гради во индустријата, во јавниот и услужен сектор, но, особено во претпријатијата за развој на информациски системи, компјутерски системи, системи кои треба да работат во реално време, апликативни решенија поврзани со дизајн и имплементација на бази на податоци, системи за поддршка на телекомуникациски услуги, услуги базирани на интернет, напредни кориснички интерфејси и друго.",
                                 @"Оваа студиска програма овозможува здобивање на знаења за примена на информатичката технологија во области како: примена на програмерската практика за поддршка на различни видови апликативни решенија, реализација на компјутерски системи од аспект на хардвер и софтвер, анализа, дизајн и имплементација на информациски системи, е-технологија и нејзина практична примена. Инженерите, специјализирани во областа на информатиката, можат брзо да се вклучат во индустријата на информациско-комуникациските технологии, компјутеризација на разни видови дејности, развој и одржување на апликации, дизајнирање на програмски и системски пакети за поддршка на производствените процеси и друго.",	
                                 @"Во прва година сите студенти се запишуваат на Академски студии по информатика. Во рамките на студиите се следат задолжителни предмети кои се во рамки на 50% од програмата. Од третиот семестар на студии се почнува со изборни предмети кои го формираат остатокот од програмата. Изборните предмети формираат модули кои ја дефинираат специјалноста на студентот и дипломата со која ќе се стекне. Покрај предметите од модулот студентот може да избира од цела низа дополнителни изборни предмети. Студентот сам го прави својот избор соодветно на неговите интереси.",
                                 @"На првиот циклус на Професионалните студии по информатички технологии студентите можат да се здобијат со специјалност од следните модули: \n1.1 Интернет и мобилни технологии \nМодулот овозможува образување на инженери кои ќе се стекнат со доволно знаење и вештини да програмираат и апликативно ги искористат информатичко комуникациските технологии засновани на современи компјутерските мрежи.\n1.2 Администрирање на компјутерски мрежи \nМодулот овозможува образување инженери кои ќе се стекнат со доволно знаење и вештини да ги поставуваат и одржуваат компјутерите и компјутерските мрежи, како основа за информатичко комуникациските технологии.",
                                 @"Овие студии ќе обезбедат кадар за техничко-апликативна поддршка на сите стопански дејности кои работат со компјутерски технологии. Областите кои се изучуваат се постојан двигател на развојот и на останатите информатички технологии и дипломираните кадри ќе можат лесно да најдат работа во компаниите и истражувачките центри, бидејќи покрај тоа што би биле обучени да учествуваат во развивање, имплементација и одржување на програми, ќе ги имаат основите и да продолжат со постдипломски студии и да учествуваат во интердисциплинарни проекти од науката и технологијата.",
                                 @"Овие студии ќе продуцираат кадар наменет пред сé за дизајн и одржување на информациско - комуникациската инфраструктура во стопанството - со посебен акцент на компаниите кои во својата работа користат Интернет и други комуникациски инфраструктури. Покрај базичната инфраструктура, клучна точка на интерес ќе бидат сервисите на повисоките нивоа кои денес се нудат во светот.",	
                                 @"Овие студии ќе создаваат кадар кој ќе има знаење за алатките и принципите на раководење со проекти со значајно учество на информатичката технологија од една страна, но и примена на современи информатички алатки во процесот на управување со проекти или претпријатија од друга страна. Дипломците од овие студии кои ќе бидат способни да дадат поддршка на системите што во својата работа на апликативно ниво користат иновативни технологии. Примери за области кои ќе бидат од интерес за студентите се: е-Бизнис, е-Комерција, е-Здравство, е-Управување, е-Влада, е Образование, и други сродни области.",
                                 @"Студиите се наменети за создавање на врвен кадар во областа на информатичкото образование, пред се во средните училишта. Ваквиот образован кадар е спремен да ги пренесе најновите информатички технологии на учениците, ќе овозможи повисоко ниво на познавање на информатичките технологии на сите средношколци, а ќе придонесе и да се подобри нивото на знаење на влез на идните студенти на студиите по информатика на универзитетите.", nil];
        self.list = array;
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
