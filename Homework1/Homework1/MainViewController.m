//
//  MainViewController.m
//  Homework1
//
//  Created by Imario Susilo on 6/4/14.
//  Copyright (c) 2014 imario. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *tileView;
@property (weak, nonatomic) IBOutlet UIView *writeComment;
@property (weak, nonatomic) IBOutlet UIView *tabBar;
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;
- (IBAction)onTap:(id)sender;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
        self.title = @"Post";
    }
    return self;
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    

    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.writeComment.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.writeComment.frame.size.height, self.writeComment.frame.size.width, self.writeComment.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.writeComment.frame = CGRectMake(0, self.view.frame.size.height - self.writeComment.frame.size.height -self.tabBar.frame.size.height, self.writeComment.frame.size.width, self.writeComment.frame.size.height);
                     }
                     completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tileView.layer.cornerRadius = 5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}
@end
