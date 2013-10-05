//
//  NCCollectionView.m
//  NestContact
//
//  Created by sunny on 13-9-27.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCCollectionVC.h"
#import "NCCollectionHeaderView.h"
#import "NCPersonDisplayCell.h"
#import <RHAddressBook/AddressBook.h>
#import "NCData.h"


@interface NCCollectionVC ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSArray* groups;
@property (nonatomic, strong) RHAddressBook* addressBook;
- (IBAction)addButtonTouched:(id)sender;

@end
@implementation NCCollectionVC

- (void)viewDidLoad
{
    [super viewDidLoad];

//    [[NCData shared] requestLoadAddressBookWithUIHandler:^(BOOL granted) {
//        self.addressBook = [[NCData shared] addressBook];
//        [self.collectionView reloadData];
//    }];
    self.addressBook = [[RHAddressBook alloc] init];
    [self.addressBook requestAuthorizationWithCompletion:^(bool granted, NSError *error) {
        if (granted)
        {
//            NSArray* people = [self.addressBook peopleOrderedByFirstName];
//            NSLog(@"%@", people);
            self.groups = self.addressBook.groups;
        }
        else
        {
            
        }
    }];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.groups.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.groups[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NCPersonDisplayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"User" forIndexPath:indexPath];
    RHGroup* group = self.groups[indexPath.section];
    RHPerson* person = group.members[indexPath.row];
    [cell setAvatar:person.thumbnail];
    [cell setName:person.firstName];
    [cell setPhoneNumber:[person.phoneNumbers valueAtIndex:0]];
//
    cell.contentView.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NCCollectionHeaderView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyHeader" forIndexPath:indexPath];
    RHGroup* group = self.addressBook.groups[indexPath.section];
    [headerView setGroupName:group.name];
    return headerView;
}

- (IBAction)addButtonTouched:(id)sender
{

    
    RHPerson* person = [RHPerson newPersonInSource:self.addressBook.defaultSource];
    person.lastName = @"xlastName";
    person.firstName = @"xfirstName";
    
    RHMutableMultiValue* value = [[RHMutableMultiValue alloc] initWithType:kABMultiStringPropertyType];
    ABMultiValueIdentifier result = [value addValue:@"12312312312" withLabel:RHPersonPhoneMainLabel];
    if (result == kABMultiValueInvalidIdentifier)
    {
        NSLog(@"result error");
    }
    [person setPhoneNumbers:value];
    NSError* error = nil;

    [self.addressBook addPerson:person error:&error];
    [self.addressBook saveWithError:&error];

    RHGroup* group = self.addressBook.groups[0];
    NSLog(@"%@", group);
    [group addMember:person];
    [group saveWithError:&error];

    NSLog(@"%@", error);
}
@end
