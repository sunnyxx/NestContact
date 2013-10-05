//
//  NCAddressBook.m
//  NestContact
//
//  Created by sunny on 13-10-3.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCData.h"
#import <RHAddressBook/AddressBook.h>
#import "NCMemoryStorage.h"

@interface NCData ()
@property (nonatomic, strong) NCMemoryStorage* memory;
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
        self.memory = [NCMemoryStorage new];
    }
    return self;
}

- (void)requestLoadAddressBookWithUIHandler:(void (^)(BOOL))block
{
    RHAddressBook* addressBook = [RHAddressBook new];
    [addressBook requestAuthorizationWithCompletion:^(bool granted, NSError *error) {
        
        if (granted)
        {
            self.memory.addressBook = addressBook;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            block(granted);
        });
    }];
}

- (RHAddressBook *)addressBook
{
    return self.memory.addressBook;
}
@end
