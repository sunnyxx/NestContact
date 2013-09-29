//
//  NCSpringLayout.m
//  NestContact
//
//  Created by sunny on 13-9-27.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCSpringLayout.h"

@interface NCSpringLayout ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end
@implementation NCSpringLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.animator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
    
    CGSize contentSize = [self collectionViewContentSize];
    NSArray* items = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, contentSize.width, contentSize.height)];
    for (UICollectionViewLayoutAttributes* item in items)
    {
        UIAttachmentBehavior* attach = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:item.center];
        attach.length = 10.0f;
        attach.damping = 0.1f;
        attach.frequency = 10.1f;
        [self.animator addBehavior:attach];
    }
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [self.animator itemsInRect:rect];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes* item = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:kind withIndexPath:indexPath];
    item.frame = CGRectMake(0, 0, 100, 20);
    
    return item;
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.animator layoutAttributesForCellAtIndexPath:indexPath];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    UIScrollView *scrollView = self.collectionView;
    CGFloat scrollDelta = newBounds.origin.y - scrollView.bounds.origin.y;
    
    //Get the touch point
    CGPoint touchLocation = [scrollView.panGestureRecognizer locationInView:scrollView];
    
    for (UIAttachmentBehavior *spring in self.animator.behaviors) {
        CGPoint anchorPoint = spring.anchorPoint;
        
        CGFloat distanceFromTouch = fabsf(touchLocation.y - anchorPoint.y);
        CGFloat scrollResistance = distanceFromTouch / 100;
        
        UICollectionViewLayoutAttributes *item = [spring.items firstObject];
        CGPoint center = item.center;
        
        //In case the added value bigger than the scrollDelta, which leads an unreasonable effect
        center.y += (scrollDelta > 0) ? MIN(scrollDelta, scrollDelta * scrollResistance) : MAX(scrollDelta, scrollDelta * scrollResistance);
        item.center = center;
        
        [self.animator updateItemUsingCurrentState:item];
    }
    return NO;
}
@end
