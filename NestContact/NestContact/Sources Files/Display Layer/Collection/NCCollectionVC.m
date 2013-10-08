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
#import "NCData.h"


@interface NCCollectionVC ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, weak) NCAddressBook* addressBook;
- (IBAction)addButtonTouched:(id)sender;

@end
@implementation NCCollectionVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NCData shared].addressBook requestLoadAddressBook:^(BOOL granted) {
        if (granted)
        {
            self.addressBook = [NCData shared].addressBook;
            [self.collectionView reloadData];
        }
    }];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.addressBook.assignedGroups count];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.addressBook.assignedGroups[section] memberCount];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NCPersonDisplayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"User" forIndexPath:indexPath];
    NCAddressBookGroup* group = self.addressBook.assignedGroups[indexPath.section];
    NCAddressBookMember* member = group.members[indexPath.row];
    
    [cell setAvatar:member.avatarImage];
    [cell setName:member.name];
    [cell setPhoneNumber:member.phoneNumbers[0]];
//
    cell.contentView.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NCCollectionHeaderView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyHeader" forIndexPath:indexPath];
    NCAddressBookGroup* group = self.addressBook.assignedGroups[indexPath.section];
    [headerView setGroupName:group.name];
    return headerView;
}

- (IBAction)addButtonTouched:(id)sender
{
//    
//    RHMutableMultiValue* value = [[RHMutableMultiValue alloc] initWithType:kABMultiStringPropertyType];
//    ABMultiValueIdentifier result = [value addValue:@"12312312312" withLabel:RHPersonPhoneMainLabel];
//    if (result == kABMultiValueInvalidIdentifier)
//    {
//        NSLog(@"result error");
//    }
//    [person setPhoneNumbers:value];
//    NSError* error = nil;
//
//    [self.addressBook addPerson:person error:&error];
//    [self.addressBook saveWithError:&error];
//
//    RHGroup* group = self.addressBook.groups[0];
//    NSLog(@"%@", group);
//    [group addMember:person];
//    [group saveWithError:&error];
//
//    NSLog(@"%@", error);
}
@end
