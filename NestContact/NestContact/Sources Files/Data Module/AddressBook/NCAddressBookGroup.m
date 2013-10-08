//
//  NCAddressBookGroup.m
//  NestContact
//
//  Created by sunny on 13-10-6.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCAddressBookGroup.h"
#import <RHAddressBook/AddressBook.h>
#import "NCAddressBook.h"
#import "NCAddressBookMember.h"

//--------------------
// NCAddressBookGroup
//--------------------

@interface NCAddressBookGroup ()
@property (nonatomic, strong) NSMutableArray* mutableMembers;
@end

@implementation NCAddressBookGroup
@dynamic members;

- (id)init
{
    self = [super init];
    if (self)
    {
        self.mutableMembers = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithRHGroup:(RHGroup *)group
{
    self = [self init];
    if (self)
    {
        self.name = group.name;
        self.groupID = group.recordID;
    }
    return self;
}

- (NSArray *)members
{
    return [NSArray arrayWithArray:self.mutableMembers];
}

- (NSInteger)memberCount
{
    return self.mutableMembers.count;
}

- (void)setMembers:(NSArray *)members
{
    self.mutableMembers = [members mutableCopy];
}

- (void)addMember:(NCAddressBookMember *)member
{
    [self.mutableMembers addObject:member];
}

- (void)removeMember:(NCAddressBookMember *)member
{
    [self.mutableMembers removeObject:member];
}

- (BOOL)containsMember:(NCAddressBookMember *)member
{
    return [self memberWithID:member.memberID] != nil;
}

- (NCAddressBookMember *)memberWithID:(NSInteger)memberID
{
    return [self.mutableMembers match:^BOOL(NCAddressBookMember* aMember) {
        return aMember.memberID == memberID;
    }];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@:{name:%@(%d)}", [super description], self.name, self.memberCount];
}

@end
