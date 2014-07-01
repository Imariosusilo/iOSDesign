//
//  TabViewController.m
//  Homework4
//
//  Created by Imario Susilo on 6/25/14.
//  Copyright (c) 2014 imario. All rights reserved.
//

#import "TabViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "ActivityViewController.h"
#import "ProfileViewController.h"
#import "ComposeViewController.h"

@interface TabViewController ()

- (IBAction)onSearchButton:(id)sender;
- (IBAction)onComposeButton:(id)sender;
- (IBAction)onProfileButton:(id)sender;
- (IBAction)onActivityButton:(id)sender;
- (IBAction)onHomeButton:(id)sender;

@property (nonatomic, strong) HomeViewController *
    homeViewController;
@property (nonatomic, strong) ComposeViewController *
    composeViewController;
@property (nonatomic, strong) SearchViewController *
    searchViewController;
@property (nonatomic, strong) ActivityViewController *
    activityViewController;
@property (nonatomic, strong) ProfileViewController *
    profileViewController;
@property (nonatomic, strong) UINavigationController * homeNavigationController;




@property (weak, nonatomic) IBOutlet UIView *contentView;


@end

@implementation TabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.homeViewController =[[HomeViewController alloc] init];
        
        self.homeNavigationController = [[UINavigationController alloc] initWithRootViewController:self.homeViewController];
        
        self.searchViewController = [[SearchViewController alloc] init];
        self.profileViewController = [[ProfileViewController alloc] init];
        self.composeViewController = [[ComposeViewController alloc] init];
        self.activityViewController = [[ActivityViewController alloc] init];



        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.homeNavigationController.view.frame = self.contentView.frame;
    
    [self.contentView addSubview:self.homeNavigationController.view];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSearchButton:(id)sender {
    self.searchViewController.view.frame =self.contentView.frame;
    [self.contentView addSubview:self.searchViewController.view];
}

- (IBAction)onComposeButton:(id)sender {
    self.composeViewController.view.frame =self.contentView.frame;
    [self.contentView addSubview:self.composeViewController.view];
}

- (IBAction)onProfileButton:(id)sender {
    self.profileViewController.view.frame =self.contentView.frame;
    [self.contentView addSubview:self.profileViewController.view];
    
}

- (IBAction)onActivityButton:(id)sender {
    NSLog(@"test");
    self.activityViewController.view.frame =self.contentView.frame;
    [self.contentView addSubview:self.activityViewController.view];
}

- (IBAction)onHomeButton:(id)sender {
    
    self.homeNavigationController.view.frame =self.contentView.frame;
    [self.contentView addSubview:self.homeNavigationController.view];
}
@end
