//
//  FBLoadingViewController.m
//  LoginScreen
//
//  Created by Imario Susilo on 6/16/14.
//  Copyright (c) 2014 imario. All rights reserved.
//

#import "FBLoadingViewController.h"
#import "FBViewController.h"


@interface FBLoadingViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;
-(void) loadNext;
@end

@implementation FBLoadingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)loadNext{
    UIViewController *vc = [[FBViewController alloc] init];
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:vc animated:YES completion:nil];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.loadingView startAnimating];
    [self performSelector:@selector (loadNext) withObject :nil afterDelay:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
