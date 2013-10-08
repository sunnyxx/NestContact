//
//  NCGroupCollectionViewCell.m
//  NestContact
//
//  Created by sunny on 13-10-6.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCGroupCollectionViewCell.h"

@interface NCGroupCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *groupNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupNumberLabel;

@end
@implementation NCGroupCollectionViewCell

- (void)setGroupName:(NSString *)groupName
{
    self.groupNameLabel.text = groupName;
}

- (void)setNumberOfPeopleInGroup:(NSUInteger)number
{
    self.groupNumberLabel.text = [NSString stringWithFormat:@"人数:%u", number];
}

@end
