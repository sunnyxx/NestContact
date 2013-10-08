//
//  NCAddressBook.m
//  NestContact
//
//  Created by sunny on 13-10-6.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCAddressBook.h"
#import <RHAddressBook/AddressBook.h>

@interface NCAddressBook ()

// meta data
@property (nonatomic, strong) RHAddressBook* rhAddressBook;
@property (nonatomic, strong) NSArray* allMembers;

// data loading
@property (nonatomic) BOOL hasLoadedAddressBook;
- (void)loadAddressBook;
@end

@implementation NCAddressBook

- (id)init
{
    self = [super init];
    if (self)
    {
        self.rhAddressBook = [RHAddressBook new];
        self.hasLoadedAddressBook = NO;
    }
    return self;
}

- (void)requestLoadAddressBook:(void (^)(BOOL))block
{
    [self.rhAddressBook requestAuthorizationWithCompletion:^(bool granted, NSError *error) {
        
        if (!self.hasLoadedAddressBook)
        {
            [self loadAddressBook];
            self.hasLoadedAddressBook = YES;
        }
        // done block
        dispatch_async(dispatch_get_main_queue(), ^{
            block(granted);
        });
    }];
}

#pragma mark - Data Loading

- (void)loadAddressBook
{
    // Fetch from RHAddressBook
    NSArray* allRHPeople = [self.rhAddressBook people];
    NSArray* allRHGroups = [self.rhAddressBook groups];
    
    // Load all members
    NSMutableArray* allNCPeople = [NSMutableArray arrayWithCapacity:allRHPeople.count];
    [allRHPeople each:^(RHPerson* person) {
        NCAddressBookMember* myMember = [[NCAddressBookMember alloc] initWithRHPerson:person];
        [allNCPeople addObject:myMember];
    }];
    self.allMembers = allNCPeople;
    // Load all members group
    self.allMembersGroup = [NCAddressBookGroup new];
    
    self.allMembersGroup.members = allNCPeople;
    
    // Load all named groups
    NSMutableArray* allNamedGroups = [NSMutableArray arrayWithCapacity:allRHGroups.count];
    [allRHGroups each:^(RHGroup* group) {
        NCAddressBookGroup* oneNamedGroup = [[NCAddressBookGroup alloc] initWithRHGroup:group];
        NSArray* members = [group members];
        [members each:^(RHPerson* person) {
            NCAddressBookMember* member = [self.allMembersGroup memberWithID:person.recordID];
            [oneNamedGroup addMember:member];
        }];
        [allNamedGroups addObject:oneNamedGroup];
    }];
    self.assignedGroups = allNamedGroups;
    
    // Load all un members
    NSArray* unnamedMembers = [self.allMembers reject:^BOOL(NCAddressBookMember* member) {
        return [self.assignedGroups any:^(NCAddressBookGroup* namedGroup) {
            return [namedGroup containsMember:member];
        }];
    }];
    
    self.unassignedGroup = [NCAddressBookGroup new];
    self.unassignedGroup.name = @"unnamed";
    [unnamedMembers each:^(NCAddressBookMember* member) {
        [self.unassignedGroup addMember:member];
    }];
}

#pragma mark - Operations

- (void)addGroup:(NCAddressBookGroup *)group
{
    
}

- (void)removeGroup:(NCAddressBookGroup *)group
{
    
}

- (BOOL)containsGroupName:(NSString *)name
{
    return [self.assignedGroups any:^BOOL(NCAddressBookGroup* group) {
        return [group.name isEqualToString:name];
    }];
}

@end
