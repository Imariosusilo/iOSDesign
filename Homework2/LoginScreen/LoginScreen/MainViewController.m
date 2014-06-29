//
//  MainViewController.m
//  LoginScreen
//
//  Created by Imario Susilo on 6/11/14.
//  Copyright (c) 2014 imario. All rights reserved.
//

#import "MainViewController.h"
#import "FBViewController.h"
#import "FBLoadingViewController.h"

@interface MainViewController ()
- (IBAction)onTap:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *ContainerView;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *goButton;
- (IBAction)onGoButton:(id)sender;
- (IBAction)onEditingChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;
@property (weak, nonatomic) IBOutlet UIView *logginBar;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIView *signUpView;

-(void)checkResponse;


- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;


@end

@implementation MainViewController

CGRect loginFrame;
CGRect signUpFrame;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    loginFrame = self.logginBar.frame;
    signUpFrame = self.signUpView.frame;
    self.goButton.enabled = YES;
    self.logginBar.layer.cornerRadius = 3;

    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
        NSLog(@"test1");
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);

    
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.logginBar.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.logginBar.frame.size.height, self.logginBar.frame.size.width, self.logginBar.frame.size.height);

                     }
                     completion:nil];
   //animate the other view
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.signUpView.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.signUpView.frame.size.height, self.signUpView.frame.size.width, self.signUpView.frame.size.height);
                         
                     }
                     completion:nil];
    //to make it go down, make a
}
- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSLog(@"test");
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);

    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.logginBar.frame = CGRectMake(0, loginFrame.origin.y, self.logginBar.frame.size.width, self.logginBar.frame.size.height);
                     }
                     completion:nil];
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.signUpView.frame = CGRectMake(0, signUpFrame.origin.y, self.signUpView.frame.size.width, self.signUpView.frame.size.height);
                     }
                     completion:nil];

    
   
    //to make it go down, make a
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onGoButton:(id)sender {
    [self.loadingView startAnimating];
    //this mean, when you hit on go button. Hold 1 second before it generates check response method
    [self performSelector:@selector (checkResponse) withObject :nil afterDelay:1];
    
    
}
- (IBAction)onEditingChanged:(id)sender {if ([self.inputField.text isEqualToString:@""]) {self.goButton.enabled =NO;} else{
    self.goButton.enabled =YES;
}
}
- (void) checkResponse {
    [self.loadingView stopAnimating];
    
    if ([self.inputField.text isEqualToString:@"imario"]&&
        [self.passwordField.text isEqualToString:@"susilo"])
    {
        UIViewController *vc = [[FBLoadingViewController alloc] init];
        vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        [self presentViewController:vc animated:YES completion:nil];
         
    }
    else {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Incorrect Pasword" message:@"The Password you entered is incorrect.Please try again" delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil];
        
        
        [alertView show];
    }

    
}



- (IBAction)onTap:(id)sender {
   [self.view endEditing:YES];
}
@end
