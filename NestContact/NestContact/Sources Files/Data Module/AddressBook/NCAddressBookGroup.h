//
//  NCAddressBookGroup.h
//  NestContact
//
//  Created by sunny on 13-10-6.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

@class NCAddressBook;
@class NCAddressBookMember;

@interface NCAddressBookGroup : NSObject
// attributes
@property (nonatomic) NSInteger groupID;
@property (nonatomic, strong) NSString* name;
// members
@property (nonatomic, strong) NSArray* members;
@property (nonatomic, readonly) NSInteger memberCount;
- (void)addMember:(NCAddressBookMember *)member;
- (void)removeMember:(NCAddressBookMember *)member;
- (BOOL)containsMember:(NCAddressBookMember *)member;
- (NCAddressBookMember *)memberWithID:(NSInteger)memberID;
@end

// private
@interface NCAddressBookGroup ()
- (instancetype)initWithRHGroup:(id)group;
@end