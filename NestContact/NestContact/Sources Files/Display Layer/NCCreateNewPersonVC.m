//
//  NCCreateNewPersonVC.m
//  NestContact
//
//  Created by sunny on 13-10-5.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCCreateNewPersonVC.h"

@interface NCCreateNewPersonVC ()
- (IBAction)doneButtonTouched:(UIBarButtonItem *)sender;

@end

@implementation NCCreateNewPersonVC


- (IBAction)doneButtonTouched:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
