//
//  NCCollectionHeaderView.m
//  NestContact
//
//  Created by sunny on 13-9-27.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCCollectionHeaderView.h"

@interface NCCollectionHeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *groupNameLabel;

@end
@implementation NCCollectionHeaderView

- (void)setGroupName:(NSString *)groupName
{
    self.groupNameLabel.text = groupName;
}

@end
