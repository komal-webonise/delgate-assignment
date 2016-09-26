//
//  CustomizeAlertView.m
//  CustomAlertView
//
//  Created by komal lunkad on 21/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import "CustomizeAlertView.h"
#import "FirstViewController.h"
typedef void (^blockTypeSelector)(void);
@interface CustomizeAlertView(){
NSString *firstAlertButton, *secondAlertButton, *message;
}
@end

@implementation CustomizeAlertView

@synthesize delegateObject;

UIButton *buttonFirstAlert;
FirstViewController *firstViewController;
blockTypeSelector yesBlockSelector,noBlockSelector;
UIView *viewAlert;


-(id)initWithDelegate:(id)viewControllerObject labelMessage:(NSString*)labelText firstButton:(NSString*)buttonFirstText secondButton:(NSString*)buttonSecondText{
    self = [super init];
    self.delegateObject = (id)viewControllerObject;
    self->message = labelText;
    self->firstAlertButton = buttonFirstText;
    self->secondAlertButton = buttonSecondText;
    [self createAlertView];
    return self;
}

-(UIView*)initWithBlock:(NSString*)labelText firstButton:(NSString*)buttonFirstText secondButton:(NSString*)buttonSecondText firstBlock: (void(^)(void))yesBlock  secondBlock:(void(^)(void))noBlock{
    self = [super init];
    self->message = labelText;
    self->firstAlertButton = buttonFirstText;
    self->secondAlertButton = buttonSecondText;
    yesBlockSelector = yesBlock;
    noBlockSelector = noBlock;
    [self createAlertView];
    return self;

}

/** Creates view
 * \returns UIView element
 */
-(void)createView{
 [self setFrame:CGRectMake(50, 100, 250, 100)];
 
}

/** Creates first alert button
 * \returns UIButton element
 */
-(UIButton*)createButtonFirst{
    UIButton *buttonFirstAlert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonFirstAlert.frame = CGRectMake(30,65 , 50, 40);
    [buttonFirstAlert setTitle:self->firstAlertButton forState:UIControlStateNormal];
    return buttonFirstAlert;
}

/** Creates second alert button
 * \returns UIButton element
 */
-(UIButton*)createButtonSecond{
    UIButton *buttonSecondAlert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonSecondAlert.frame = CGRectMake(70,65 , 50, 40);
    [buttonSecondAlert setTitle:self->secondAlertButton forState:UIControlStateNormal];
    return buttonSecondAlert;
}

/** Creates label
 * \returns UILabel element
 */
-(UILabel*)createLabel{
    UILabel *labelMessage = [[UILabel alloc] initWithFrame: CGRectMake(30,10 , 200, 40)];
    labelMessage.backgroundColor = [UIColor clearColor];
    labelMessage.text = self->message;
    return labelMessage;
}

/** Checks whether the first alert button view controller conforms to delegate or not
 * \param sender The id of the button
*/
-(void)buttonFirstTapped:(id)sender{
    if ([delegateObject conformsToProtocol:@protocol(CustomAlertViewDelegate)])
        [delegateObject onTappedYes];
    else
        yesBlockSelector();
}

/** Checks whether the second alert button view controller conforms to delegate or not
 * \param sender The id of the button
 */
-(void)buttonSecondTapped:(id)sender{
    if ([delegateObject conformsToProtocol:@protocol(CustomAlertViewDelegate)])
        [delegateObject onTappedNo];
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
-(UIView*)createAlertView{
    [self createView];
    UILabel *labelMessage = [self createLabel];
    [self addSubview:labelMessage];
    buttonFirstAlert = [self createButtonFirst];
    [buttonFirstAlert addTarget:self action:@selector(buttonFirstTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buttonFirstAlert];
    UIButton *buttonSecondAlert = [self createButtonSecond];
    [buttonSecondAlert addTarget:self action:@selector(buttonSecondTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buttonSecondAlert];
    return viewAlert;
}

@end
