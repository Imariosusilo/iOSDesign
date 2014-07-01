iOSDesign
=========
Hey Tim,
typing the code definitely harder than copy and paste it, but I learned a bunch from doing this. so Im Stuck in this part 

-(void)checkResponse {
  
   [self.loadingView startAnimating];
    if ([self.userNameInput.text isEqualToString:@"imario"]&&[self.passWordInput.text isEqualToString:@"susilo"]){
             NSLog(@"correctInput");
        UIViewController *vc = [[LoadViewController alloc] init];
        vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:vc animated:YES completion:nil];

for some reason this method wont read on the login button. i ask Thiennga and she tried to change the && part with || and for some reason it works and load the next page.So we thought maybe those &&  is the problem?

I also uploaded the homework week 4 ( not completed yet) I tried to do the best I can to fill up the time with something useful when I get stuck or waiting for answer 