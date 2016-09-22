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

-(id)init {
    self = [super init];
    return self;
}



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
-(UIView*)getAlertView{
    return viewAlertView;
}
///** Creates view with yvalue given
// * \param yvalue The y coordinate of view
// * \returns UIView element
// */
-(UIView*)createView{
    UIView *viewAlert = [[UIView alloc] initWithFrame: CGRectMake(50, 100, 200, 100)];
    viewAlert.backgroundColor = [UIColor cyanColor];
    return viewAlert;
}
///** Creates button with yvalue given
// * \param yvalue The y coordinate of button
// * \returns UIButton element
// */
-(UIButton*)createButtonFirst:(NSString*)input{
    UIButton *buttonFirstAlert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonFirstAlert.frame = CGRectMake(30,65 , 50, 40);
    [buttonFirstAlert setTitle:input forState:UIControlStateNormal];
    return buttonFirstAlert;
}
-(UIButton*)createButtonSecond:(NSString*)input{
    UIButton *buttonSecondAlert = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonSecondAlert.frame = CGRectMake(70,65 , 50, 40);
    [buttonSecondAlert setTitle:input forState:UIControlStateNormal];
    return buttonSecondAlert;
}
///** Creates label for product name
// * \param input The text to be displayed on label
// * \returns UILabel element
// */
-(UILabel*)createLabel:(NSString*)input{
    UILabel *labelMessage = [[UILabel alloc] initWithFrame: CGRectMake(30,10 , 150, 40)];
    labelMessage.backgroundColor = [UIColor clearColor];
    labelMessage.text=input;
    return labelMessage;
}
-(void)buttonFirstTapped:(id)sender{
    [delegate onTappedYes];
}
-(void)buttonSecondTapped:(id)sender{
    [delegate onTappedNo];
}
@end
