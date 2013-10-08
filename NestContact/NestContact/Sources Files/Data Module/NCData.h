//
//  NCAddressBook.h
//  NestContact
//
//  Created by sunny on 13-10-3.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCAddressBook.h"

@interface NCData : NSObject

// access
+ (instancetype)shared;

@property (nonatomic, strong) NCAddressBook* addressBook;

@end
