//
//  NCViewController.m
//  NestContact
//
//  Created by sunny on 13-9-16.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCViewController.h"
@interface NCViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *wrapperImageVIew;

@property (weak, nonatomic) IBOutlet UIImageView *dogImageView;
@property (strong, nonatomic) UIDynamicAnimator* animator;
- (IBAction)startBtnTouched:(UIButton *)sender;
@end

@implementation NCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    self.navigationItem.title = @"X Contact";
//    self.navigationItem.titleView = titleButton;
    
    self.wrapperImageVIew.backgroundColor = [UIColor colorWithRed:0.9f green:0.9f blue:0.9f alpha:1.0f];
    self.wrapperImageVIew.layer.borderColor = [[UIColor blackColor] CGColor];
    self.wrapperImageVIew.layer.borderWidth = 1.0f;
    self.wrapperImageVIew.layer.cornerRadius = 0.1f*(self.wrapperImageVIew.layer.bounds.size.width+self.wrapperImageVIew.layer.bounds.size.height);
    self.wrapperImageVIew.layer.shadowRadius = 2.0f;
    self.wrapperImageVIew.layer.shadowOffset = CGSizeMake(1.0f, 2.0f);
    self.wrapperImageVIew.layer.shadowOpacity = 0.8f;
    self.wrapperImageVIew.userInteractionEnabled = YES;
    [self.wrapperImageVIew whenTapped:^{
        self.wrapperImageVIew.layer.shadowColor = [[UIColor darkGrayColor] CGColor];
        self.wrapperImageVIew.layer.borderWidth = 5.0f;
        self.wrapperImageVIew.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    }];
    
    self.dogImageView.layer.borderWidth = 2.0f;
    self.dogImageView.layer.borderColor = [[UIColor blackColor] CGColor];
    self.dogImageView.layer.cornerRadius = 20.0f;

    // Get your image somehow
    UIImage *image = self.dogImageView.image;
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContextWithOptions(self.dogImageView.bounds.size, NO, 1.0);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:self.dogImageView.bounds
                                cornerRadius:20.0] addClip];
    // Draw your image
    [image drawInRect:self.dogImageView.bounds];
    
    // Get the image, here setting the UIImageView image
    self.dogImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    
    
    // UIMotion
    UIInterpolatingMotionEffect* effectX = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    effectX.minimumRelativeValue = @-5;
    effectX.maximumRelativeValue = @5;
    [self.dogImageView addMotionEffect:effectX];
    
    UIInterpolatingMotionEffect* effectY = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    effectY.minimumRelativeValue = @-5;
    effectY.maximumRelativeValue = @5;
    [self.dogImageView addMotionEffect:effectY];
    

    
}

- (IBAction)startBtnTouched:(UIButton *)sender
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

//    // snap
//    UISnapBehavior* snap = [[UISnapBehavior alloc] initWithItem:self.dogImageView snapToPoint:CGPointMake(0, 0)];
//    snap.damping = 0.5f;
//    [self.animator addBehavior:snap];
    
    // gravity
    UIGravityBehavior* gravity = [[UIGravityBehavior alloc] initWithItems:@[self.dogImageView]];
    [self.animator addBehavior:gravity];

    // item
    UIDynamicItemBehavior* itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.dogImageView]];
    itemBehavior.allowsRotation = YES;
    itemBehavior.elasticity = 0.9f;
    [itemBehavior addAngularVelocity:M_PI_2 forItem:self.dogImageView];
    [self.animator addBehavior:itemBehavior];
    
    UIPushBehavior* push = [[UIPushBehavior alloc] initWithItems:@[self.dogImageView] mode:UIPushBehaviorModeContinuous];
    push.magnitude = 1.0f;
    push.angle = 1.0f;
    [self.animator addBehavior:push];
    
    // collision
    UICollisionBehavior* collision = [[UICollisionBehavior alloc] initWithItems:@[self.dogImageView]];
    collision.collisionMode = UICollisionBehaviorModeBoundaries;
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collision];
    
}
@end
