//
//  MainViewController.m
//  Homework3
//
//  Created by Imario Susilo on 6/20/14.
//  Copyright (c) 2014 imario. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *headLineView;
- (IBAction)onPanNews:(UIPanGestureRecognizer *)sender;



- (IBAction)onPanHL:(UIPanGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *newsView;

@end

@implementation MainViewController
CGPoint center;
CGPoint original;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:1 delay:1 options:0 animations:^{
        self.headLineView.frame = CGRectMake(0, self.view.frame.size.height-50, self.headLineView.frame.size.width, self.headLineView.frame.size.height);
   } completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (IBAction)onPanNews:(UIPanGestureRecognizer *)sender {
    center =self.newsView.center;
    CGPoint transpoint;
    if (sender.state == UIGestureRecognizerStateBegan) {
        original = center;
    }
    transpoint = [sender translationInView:self.view];
    //animating normally
    
    {center.x =original.x+transpoint.x;
        self.newsView.center = center;
    }
    //if (self.newsView.frame.origin.x < 0)
    //{
       // center.x = original.x + transpoint.x/30;
        //self.newsView.center = center;}
    if (sender.state==UIGestureRecognizerStateEnded) {
        if (transpoint.x > 0) {
            [UIView animateWithDuration:1 delay:0 options:0 animations:^{
                self.newsView.frame = CGRectMake(0, self.headLineView.frame.size.height-self.newsView.frame.size.height, self.newsView.frame.size.width, self.newsView.frame.size.height);
            } completion:nil];
        }else
        {
            [UIView animateWithDuration:1 delay:0 options:0 animations:^{
                self.newsView.frame = CGRectMake(self.headLineView.frame.size.width-self.newsView.frame.size.width, self.headLineView.frame.size.height-self.newsView.frame.size.height, self.newsView.frame.size.width, self.newsView.frame.size.height);
            } completion:nil];}
    }


    
        
}

- (IBAction)onPanHL:(UIPanGestureRecognizer *)sender {
    center = self.headLineView.center;
    CGPoint transPoint;
    if (sender.state == UIGestureRecognizerStateBegan){
        original = center;
        NSLog(@"center %@:",NSStringFromCGPoint(original));
    }
    transPoint = [sender translationInView:self.view];
    //create friction
    if (self.headLineView.frame.origin.y < 0)
    {
        center.y = original.y + transPoint.y/30;
        self.headLineView.center=center;
    }else
    {
        center.y = original.y + transPoint.y;
        self.headLineView.center=center;
    }
    //animte the rest of the way
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        //animate down
        if (transPoint.y > 0) {
            [UIView animateWithDuration:1 delay:0 options:0 animations:^{
                    self.headLineView.frame = CGRectMake(0, self.view.frame.size.height-50, self.headLineView.frame.size.width, self.headLineView.frame.size.height);
                   } completion:nil];
        //animate up
        }else
        {
            NSLog(@"tsfdsd");
                [UIView animateWithDuration:1 delay:0 options:0 animations:^{
                       self.headLineView.frame = CGRectMake(0, 0, self.headLineView.frame.size.width, self.headLineView.frame.size.height);
                 } completion:nil];
        }
    
        }

}
@end
