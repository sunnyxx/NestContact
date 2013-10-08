//
//  NCAddressBook.m
//  NestContact
//
//  Created by sunny on 13-10-3.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCData.h"

@interface NCData ()
@end

@implementation NCData

+ (instancetype)shared
{
    static NCData* singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [self new];
    });
    return singleton;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.addressBook = [NCAddressBook new];
    }
    return self;
}

@end
