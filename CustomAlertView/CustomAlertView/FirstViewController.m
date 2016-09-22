//
//  FirstViewController.m
//  CustomAlertView
//
//  Created by komal lunkad on 21/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end


@implementation FirstViewController
CustomizeAlertView *customizeAlertView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTappedShowAlertView:(id)sender {
    customizeAlertView = [[CustomizeAlertView alloc]init];
    customizeAlertView.delegate = self;
    [customizeAlertView createAlertView:@"Hello" firstButton:@"yes" secondButton:@"no"];
    UIView *alertView = [customizeAlertView getAlertView];
    [self.view addSubview:alertView];
}
-(void)onTappedYes{
    NSLog(@"yes");
}
-(void)onTappedNo{
    NSLog(@"no");

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
