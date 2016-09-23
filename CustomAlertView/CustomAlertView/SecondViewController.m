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
CustomizeAlertView *customizeAlertViewSecond;
UIView *alertViewSecond;

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
    customizeAlertViewSecond = [[CustomizeAlertView alloc]init];
    [customizeAlertViewSecond createAlertView:@"Second View Controller" firstButton:@"yes" secondButton:@"no"];
    [customizeAlertViewSecond onTappedYesBlock:^{
        NSLog(@"yes block");
        [self postObserverNotification];
    }];
    [customizeAlertViewSecond onTappedNoBlock:^{
        NSLog(@"no block");
        NSLog(@"AlertView has been dismissed");
        [alertViewSecond removeFromSuperview];
    }];
    alertViewSecond = [customizeAlertViewSecond getAlertView];
    alertViewSecond.backgroundColor = [UIColor colorFromHexString:@"#ff0033"];
    [self.view addSubview:alertViewSecond];
}

/** Shows alert view
 * \param sender The id of the button
 * \returns Action on button tapped
 */
- (IBAction)onTappedShowAlertView:(id)sender {
    [self showAlertViewWithBlock];
}
@end
