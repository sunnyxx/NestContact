//
//  NCAddressBook.h
//  NestContact
//
//  Created by sunny on 13-10-3.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import <RHAddressBook/AddressBook.h>

@interface NCData : NSObject

// access
+ (instancetype)shared;

- (void)requestLoadAddressBookWithUIHandler:(void(^)(BOOL granted))block;
@property (nonatomic, readonly) RHAddressBook* addressBook;

@end
