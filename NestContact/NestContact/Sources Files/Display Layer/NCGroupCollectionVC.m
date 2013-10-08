//
//  NCGroupCVC.m
//  NestContact
//
//  Created by sunny on 13-10-5.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCGroupCollectionVC.h"
#import "NCGroupCollectionViewCell.h"

@interface NCGroupCollectionVC ()

@end

@implementation NCGroupCollectionVC

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NCGroupCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NCGroupCollectionViewCell" forIndexPath:indexPath];
    [cell setGroupName:@"group"];
    [cell setNumberOfPeopleInGroup:10];
    return cell;
}

#pragma mark - delegate

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
//    XXLog(@"highlight");
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    XXLog(@"unhighlight");

}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    collectionView.multipleTouchEnabled = YES;
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:0.5f animations:^{
        cell.backgroundColor = [UIColor purpleColor];
        XXLog(@"%d", cell.isSelected);
    }];

}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    if (cell.isSelected)
    {
        return YES;
    }
    return NO;
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    XXLog(@"%@", collectionView.indexPathsForSelectedItems);
//    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
//    [UIView animateWithDuration:0.5f animations:^{
//        cell.backgroundColor = [UIColor grayColor];
//    }];
    
}

@end
