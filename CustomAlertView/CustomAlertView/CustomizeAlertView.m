//
//  CustomizeAlertView.m
//  CustomAlertView
//
//  Created by komal lunkad on 21/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import "CustomizeAlertView.h"

@implementation CustomizeAlertView

@synthesize delegate;
UIView *viewAlertView;
UIButton *buttonFirstAlert;
void(^yesBlockSelector)(void);
void(^noBlockSelector)(void);

-(id)init {
    self = [super init];
    return self;
}

/** Creates view
 * \returns UIView element
 */
-(UIView*)createView{
    UIView *viewAlert = [[UIView alloc] initWithFrame: CGRectMake(50, 100, 250, 100)];
    return viewAlert;
}

/** Creates first alert button
 * \param input Sets text on the button
 * \returns UIButton element
 */
-(UIButton*)createButtonFirst:(NSString*)input{
    UIButton *buttonFirstAlert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonFirstAlert.frame = CGRectMake(30,65 , 50, 40);
    [buttonFirstAlert setTitle:input forState:UIControlStateNormal];
    return buttonFirstAlert;
}

/** Creates second alert button
 * \param input Sets text on the button
 * \returns UIButton element
 */
-(UIButton*)createButtonSecond:(NSString*)input{
    UIButton *buttonSecondAlert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonSecondAlert.frame = CGRectMake(70,65 , 50, 40);
    [buttonSecondAlert setTitle:input forState:UIControlStateNormal];
    return buttonSecondAlert;
}

/** Creates label
 * \param message The text to be displayed on label
 * \returns UILabel element
 */
-(UILabel*)createLabel:(NSString*)message{
    UILabel *labelMessage = [[UILabel alloc] initWithFrame: CGRectMake(30,10 , 200, 40)];
    labelMessage.backgroundColor = [UIColor clearColor];
    labelMessage.text = message;
    return labelMessage;
}

/** Checks whether the first alert button view controller conforms to delegate or not
 * \param sender The id of the button
*/
-(void)buttonFirstTapped:(id)sender{
    if ([delegate conformsToProtocol:@protocol(CustomAlertViewDelegate)])
        [delegate onTappedYes];
    else
        yesBlockSelector();
}

/** Checks whether the second alert button view controller conforms to delegate or not
 * \param sender The id of the button
 */
-(void)buttonSecondTapped:(id)sender{
    if ([delegate conformsToProtocol:@protocol(CustomAlertViewDelegate)])
        [delegate onTappedNo];
    else
        noBlockSelector();
}

/** Takes reference of yes block from view controller and sets this class block
 * \param yesBlock The reference of block from view controller
 */
-(void)onTappedYesBlock: (void(^)(void))yesBlock{
    yesBlockSelector = yesBlock;
}

/** Takes reference of no block from view controller and sets this class block
 * \param noBlock The reference of block from view controller
 */
-(void)onTappedNoBlock: (void(^)(void))noBlock{
    noBlockSelector = noBlock;
}

/** Creates alert view which has label and two buttons
 * \param message The message to be displayed on label
 * \param textFirstButton Text to be displayed on first button
 * \param textSecondButton Text to be displayed on second button
 */
-(void)createAlertView:(NSString*)message firstButton:(NSString*)textFirstButton secondButton:(NSString*)textSecondButton{
    UIView *viewAlert = [self createView];
    UILabel *labelMessage = [self createLabel:message];
    [viewAlert addSubview:labelMessage];
    buttonFirstAlert = [self createButtonFirst:textFirstButton];
    [buttonFirstAlert addTarget:self action:@selector(buttonFirstTapped:) forControlEvents:UIControlEventTouchUpInside];
    [viewAlert addSubview:buttonFirstAlert];
    UIButton *buttonSecondAlert = [self createButtonSecond:textSecondButton];
    [buttonSecondAlert addTarget:self action:@selector(buttonSecondTapped:) forControlEvents:UIControlEventTouchUpInside];
    [viewAlert addSubview:buttonSecondAlert];
    viewAlertView = viewAlert;
}

/** Returns alert view
 * \returns UIView element
 */
-(UIView*)getAlertView{
    return viewAlertView;
}

@end
