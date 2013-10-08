//
//  NCAddressBookMember.h
//  NestContact
//
//  Created by sunny on 13-10-6.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

@interface NCAddressBookMember : NSObject
// attributes
@property (nonatomic) NSInteger memberID;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* nickname;
@property (nonatomic, strong) UIImage* avatarImage;
@property (nonatomic, strong) NSArray* phoneNumbers;
@end

// private
@interface NCAddressBookMember ()
- (instancetype)initWithRHPerson:(id)person;

@end