//
//  SecondViewController.m
//  CustomAlertView
//
//  Created by komal lunkad on 22/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import "SecondViewController.h"
#include "CustomizeAlertView.h"
#include "UIColorCategory.h"
#include "CONSTANTS.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
CustomizeAlertView *customizeAlertview;
UIView *alertview;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/** Posts observer notification to the observer
 */
-(void)postObserverNotification{
    NSString *name = @"SecondView Controller";
    NSDictionary *info = @{@"name":@"second controller"};
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NAME object:name userInfo:info];
}

/** Creates alertview, attaches to the view controller and defines action for alert buttons
 */
-(void)showAlertViewWithBlock{
    customizeAlertview = [[CustomizeAlertView alloc]initWithBlock:@"Second View Controller" firstButton:@"yes" secondButton:@"no" firstBlock:^{
        NSLog(@"yes block");
        [self postObserverNotification];
    } secondBlock:^{
        NSLog(@"no block");
        NSLog(@"AlertView has been dismissed");
        [customizeAlertview removeFromSuperview];
    }];
    customizeAlertview.backgroundColor = [UIColor colorFromHexString:@"#ff0033"];
    [self.view addSubview:customizeAlertview];
}

/** Shows alert view
 * \param sender The id of the button
 * \returns Action on button tapped
 */
- (IBAction)onTappedShowAlertView:(id)sender {
    [self showAlertViewWithBlock];
}
@end
