//
//  NCCollectionView.m
//  NestContact
//
//  Created by sunny on 13-9-27.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCCollectionVC.h"
#import "NCCollectionHeaderView.h"
#import <RHAddressBook/AddressBook.h>

@interface NCCollectionVC ()
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end
@implementation NCCollectionVC

- (void)viewDidLoad
{
    [super viewDidLoad];

//    UIScreenEdgePanGestureRecognizer* edgePanGestrue = [[UIScreenEdgePanGestureRecognizer alloc] initWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
//        NSLog(@"%@", NSStringFromCGPoint(location));
//    }];
//    edgePanGestrue.edges = UIRectEdgeAll;
//    [self.view addGestureRecognizer:edgePanGestrue];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"User" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyHeader" forIndexPath:indexPath];
//    headerView.backgroundColor = [UIColor redColor];
//    if (!headerView)
//    {
//        headerView = [[UICollectionReusableView alloc] init];
//
//    }
    
//    return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
    return headerView;
}

@end
