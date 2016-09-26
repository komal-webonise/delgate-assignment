//
//  FirstViewController.m
//  CustomAlertView
//
//  Created by komal lunkad on 21/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import "FirstViewController.h"
#import "UIColorCategory.h"
#include "SecondViewController.h"
#include "CONSTANTS.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

CustomizeAlertView *customizeAlertView;

- (void)viewDidLoad {
    [super viewDidLoad];
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notified:) name:NOTIFICATION_NAME object:nil];
}

/** Notifies notification object and user information
* \param notification The notification center object
 */
-(void)notified: (NSNotification*)notification{
    NSLog(@"notified: %@", notification.object);
    NSLog(@"notified: %@", notification.userInfo);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/** Creates alertview and attaches to the view controller
 */
-(void)showAlertView{
    customizeAlertView = [[CustomizeAlertView alloc]initWithDelegate:self labelMessage:@"First View Controller" firstButton:@"yes" secondButton:@"no"];
    customizeAlertView.backgroundColor = [UIColor colorFromHexString:@"#abcdef31"];
    [self.view addSubview:customizeAlertView];
}

/** Shows alert view
 * \param sender The id of the button
 * \returns Action on button tapped
 */
- (IBAction)onTappedShowAlertView:(id)sender {
    [self showAlertView];
}

/** Navigates to the next view controller
 * \param sender The id of the button
 * \returns Action on button tapped
 */
- (IBAction)onTappedUsingBlock:(id)sender {
    SecondViewController *secondViewController = [self.storyboard instantiateViewControllerWithIdentifier:SECOND_VIEW_CONTROLLER_STORYBOARDNAME];
    [self.navigationController pushViewController:secondViewController animated:YES];
}

/** Posts observer notification to the observer
 */
-(void)postObserverNotification{
    NSString *name = @"FirstView Controller";
    NSDictionary *info = @{@"name":@"first controller"};
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_NAME object:name userInfo:info];
}


/** Overrides the method declared in custom alertview delegate,posts notification and dismisses alertview
 */
-(void)onTappedYes{
    NSLog(@"yes");
    [self postObserverNotification];
    [customizeAlertView removeFromSuperview];
}

/** Overrides the method declared in custom alertview delegate and dismisses alertview
 */
-(void)onTappedNo{
    NSLog(@"AlertView has been dismissed");
   [customizeAlertView removeFromSuperview];
}

@end
