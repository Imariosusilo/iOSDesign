//
//  MainViewController.m
//  Homework2Redo
//
//  Created by Imario Susilo on 6/28/14.
//  Copyright (c) 2014 imario. All rights reserved.
//

#import "MainViewController.h"
#import "LoadViewController.h"
#import "FBViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *logInContainer;
@property (weak, nonatomic) IBOutlet UITextField *userNameInput;
@property (weak, nonatomic) IBOutlet UITextField *passWordInput;
- (IBAction)onEditing:(id)sender;
- (IBAction)onLogInButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *logInButton;
@property (weak, nonatomic) IBOutlet UIView *signUpContainer;
- (void)willShowKeyboard : (NSNotification *)notification;
- (void)willHideKeyboard : (NSNotification *)notification;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;

- (IBAction)onTap:(id)sender;
-(void) checkResponse;




@end

@implementation MainViewController

CGRect logInContainer;
CGRect signUpContainer;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
         }
         
         return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    logInContainer = self.logInContainer.frame;
    signUpContainer = self.signUpContainer.frame;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

         
-(void) willShowKeyboard:(NSNotification *)notification
    {
    NSDictionary *userInfo = [notification userInfo];
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    [UIView animateWithDuration:animationDuration delay:0.0 options:(animationCurve << 16)animations:^{self.logInContainer.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.logInContainer.frame.size.height, self.logInContainer.frame.size.width, self.logInContainer.frame.size.height);
    }
                      completion:nil];
        
        [UIView animateWithDuration:animationDuration delay:0.0 options:(animationCurve << 16) animations:^{
            self.signUpContainer.frame = CGRectMake(0,  self.view.frame.size.height-kbSize.height-self.signUpContainer.frame.size.height, self.signUpContainer.frame.size.width, self.signUpContainer.frame.size.height);
        } completion:nil];
}
-(void)willHideKeyboard:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    NSLog(@"test");
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    [UIView animateWithDuration:animationDuration delay:0.0 options:(animationCurve << 16) animations:^{
        self.logInContainer.frame = CGRectMake (0,logInContainer.origin.y, self.logInContainer.frame.size.width, self.logInContainer.frame.size.height);
    } completion:nil];
    [UIView animateWithDuration:animationDuration delay:0.0 options:(animationCurve <<16) animations:^{
        self.signUpContainer.frame = CGRectMake(0,signUpContainer.origin.y, self.signUpContainer.frame.size.width, self.signUpContainer.frame.size.height);
    } completion:nil];
    
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}


- (IBAction)onEditing:(id)sender {if([self.userNameInput.text isEqualToString:@""]) {self.logInButton.enabled = NO;} else [self.view endEditing:YES];
    {if([self.passWordInput.text isEqualToString:@""]) {self.logInButton.enabled = NO;} else [self.view endEditing:YES];

 
}
}

- (IBAction)onLogInButton:(id)sender {
    [self.loadingView startAnimating];
    ([self performSelector:@selector(checkResponse) withObject:nil afterDelay:1]);


}
-(void)checkResponse {
  
   [self.loadingView startAnimating];
    if ([self.userNameInput.text isEqualToString:@"imario"]&&[self.passWordInput.text isEqualToString:@"susilo"]){
             NSLog(@"correctInput");
        UIViewController *vc = [[LoadViewController alloc] init];
        vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:vc animated:YES completion:nil];
        
      
    }
    else {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Incorect Password" message:@"The Password you entered is Incorect.Please  try again " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertView show];
    }
}
      
      
@end
