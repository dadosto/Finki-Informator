//
//  InfoController.h
//  Finki-Informator
//
//  Created by Dado on 5/22/13.
//  Copyright (c) 2013 Finki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *txtInfo;
@property (strong, nonatomic) NSArray *list;
@property NSInteger selektiranSemestar;
@end
