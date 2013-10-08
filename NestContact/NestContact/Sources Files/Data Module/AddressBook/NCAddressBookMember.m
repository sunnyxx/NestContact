//
//  NCAddressBookMember.m
//  NestContact
//
//  Created by sunny on 13-10-6.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCAddressBookMember.h"
#import <RHAddressBook/AddressBook.h>

@interface NCAddressBookMember ()

@end

@implementation NCAddressBookMember
- (instancetype)initWithRHPerson:(RHPerson *)person
{
    self = [super init];
    if (self)
    {
        self.memberID = person.recordID;
        self.name = person.firstName ? [person.lastName stringByAppendingString:person.firstName] : person.lastName;
        self.nickname = person.nickname;
        self.avatarImage = person.originalImage;
        self.phoneNumbers = [person.phoneNumbers values];
    }
    return self;
}

- (NSString *)description
{
    NSString* superString = [super description];
    return [NSString stringWithFormat:@"%@:{name:%@,nick:%@}", superString, self.name, self.nickname];
}

@end
