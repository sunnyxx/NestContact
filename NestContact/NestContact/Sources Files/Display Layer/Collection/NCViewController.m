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
//    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    self.navigationItem.title = @"X Contact";
//    self.navigationItem.titleView = titleButton;
    
    self.wrapperImageVIew.backgroundColor = [UIColor lightGrayColor];
    self.wrapperImageVIew.layer.borderColor = [[UIColor blackColor] CGColor];
    self.wrapperImageVIew.layer.borderWidth = 1.0f;
    self.wrapperImageVIew.layer.cornerRadius = 20.0f;
    self.wrapperImageVIew.layer.shadowRadius = 2.0f;
    self.wrapperImageVIew.layer.shadowOffset = CGSizeMake(1.0f, 2.0f);
    self.wrapperImageVIew.layer.shadowOpacity = 0.8f;
    
    self.dogImageView.layer.borderWidth = 2.0f;
    self.dogImageView.layer.borderColor = [[UIColor whiteColor] CGColor];
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
    
    [super viewDidLoad];
}

- (IBAction)startBtnTouched:(UIButton *)sender
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIAttachmentBehavior* attach = [[UIAttachmentBehavior alloc] initWithItem:self.dogImageView attachedToAnchor:CGPointMake(CGRectGetMidX(self.view.frame), 0)];
    attach.damping = 1.0f;
    UIGravityBehavior* behavior = [[UIGravityBehavior alloc] initWithItems:@[self.dogImageView]];
    behavior.gravityDirection = CGVectorMake(0.1f, 0.1f);
    
    [self.animator addBehavior:behavior];
    [self.animator addBehavior:attach];
//    UITransitionContextFromViewControllerKey
//    UIViewControllerHierarchyInconsistencyException
    
}
@end
