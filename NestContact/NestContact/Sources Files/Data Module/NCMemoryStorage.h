//
//  NCMemoryStorage.h
//  NestContact
//
//  Created by Sunny on 13-9-30.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import <RHAddressBook/AddressBook.h>

// ALL data stored in memory

@interface NCMemoryStorage : NSObject

@property (nonatomic, strong) RHAddressBook* addressBook;

@end
