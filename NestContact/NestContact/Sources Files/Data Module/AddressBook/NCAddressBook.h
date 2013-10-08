//
//  NCAddressBook.h
//  NestContact
//
//  Created by sunny on 13-10-6.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCAddressBookGroup.h"
#import "NCAddressBookMember.h"

@interface NCAddressBook : NSObject

// setup
- (void)requestLoadAddressBook:(void(^)(BOOL granted))block;

// group access
@property (nonatomic, strong) NCAddressBookGroup* allMembersGroup;
@property (nonatomic, strong) NCAddressBookGroup* unassignedGroup;
@property (nonatomic, strong) NSArray* assignedGroups;

// group ops
- (void)addGroup:(NCAddressBookGroup *)group;
- (void)removeGroup:(NCAddressBookGroup *)group;
- (BOOL)containsGroupName:(NSString *)name;
@end
