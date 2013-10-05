//
//  NCPersonDisplayCell.m
//  NestContact
//
//  Created by sunny on 13-10-3.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCPersonDisplayCell.h"

@interface NCPersonDisplayCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@end

@implementation NCPersonDisplayCell

- (void)setAvatar:(UIImage *)avatar
{
    self.avatarImageView.image = avatar;
}

- (void)setName:(NSString *)name
{
    self.nameLabel.text = name;
}

- (void)setPhoneNumber:(NSString *)number
{
    self.phoneNumberLabel.text = number;
}

@end
