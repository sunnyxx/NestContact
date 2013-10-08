//
//  NCAddressBookDataTests.m
//  NestContact
//
//  Created by sunny on 13-10-8.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NCAddressBook.h"
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>

@interface NCAddressBookDataTests : XCTestCase
@property (nonatomic, strong) NCAddressBook* addressBook;
@end

@implementation NCAddressBookDataTests

dispatch_semaphore_t semaphore;

void AsyncStart()
{
    semaphore = dispatch_semaphore_create(0);
    
}
void AsyncSignal()
{
    dispatch_semaphore_signal(semaphore);
}

void AsyncWait()
{
    // Run loop
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    }
}

- (void)setUp
{
    [super setUp];
    self.continueAfterFailure = YES;
    self.addressBook = [NCAddressBook new];

}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddressBookCreation
{
    XCTAssertNotNil(self.addressBook);
}

- (void)testAddressBookParseData
{
    AsyncStart();

    [self.addressBook requestLoadAddressBook:^(BOOL granted) {
        AsyncSignal();
    }];
    AsyncWait();

    XCTAssertNotNil(self.addressBook.namedGroups);
    XCTAssertNotNil(self.addressBook.unnamedGroup);
    
    XCTAssert(self.addressBook.unnamedGroup.memberCount > 0);
    __block BOOL isNamedGroupCorrect = YES;
    [self.addressBook.assignedGroups each:^(NCAddressBookGroup* group) {
        [group.members each:^(NCAddressBookMember* memberNamed) {
            isNamedGroupCorrect = [self.addressBook.unassignedGroup.members none:^BOOL(NCAddressBookMember* memberNameless) {
//                XXLog(@"%@:%@", memberNamed, memberNameless);
                return memberNamed == memberNameless;
            }];
        }];
    }];
    XCTAssert(isNamedGroupCorrect);

}


@end
