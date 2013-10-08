//
//  NCPersonPickerVC.m
//  NestContact
//
//  Created by sunny on 13-10-8.
//  Copyright (c) 2013年 sunny. All rights reserved.
//

#import "NCPersonPickerVC.h"

@interface NCPersonPickerVC ()
@property (weak, nonatomic) IBOutlet UILabel *pickedNameLabel;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panRecognizer;
- (IBAction)panGesture:(UIPanGestureRecognizer *)sender;

@end

@implementation NCPersonPickerVC

- (NSString *)phonetic:(NSString *)string
{
    
    NSMutableString *source = [string mutableCopy];
    
    CFStringTransform((CFMutableStringRef)source, NULL, kCFStringTransformMandarinLatin, NO);
    
    CFStringTransform((CFMutableStringRef)source, NULL, kCFStringTransformStripDiacritics, NO);
    
    return source;
    
}

- (IBAction)panGesture:(UIPanGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:recognizer.view];
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].applicationFrame);
        CGFloat screenHeight = CGRectGetHeight([UIScreen mainScreen].applicationFrame);
        if (point.y / screenHeight < 0.5f)
        {
            self.pickedNameLabel.text = [self phonetic:@"孙源"];
        }
        else
        {
            self.pickedNameLabel.text = @"l-z";
        }
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        
    }
}
@end
