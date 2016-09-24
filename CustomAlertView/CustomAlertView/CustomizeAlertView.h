//
//  CustomizeAlertView.h
//  CustomAlertView
//
//  Created by komal lunkad on 21/09/16.
//  Copyright © 2016 komal lunkad. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CustomAlertViewDelegate <NSObject>
-(void)onTappedYes;
-(void)onTappedNo;
@end
@interface CustomizeAlertView : UIView
@property (nonatomic,strong) id<CustomAlertViewDelegate> delegateObject;
@property (nonatomic,strong) NSString* message;
@property (nonatomic,strong) NSString* firstAlertButton;
@property (nonatomic,strong) NSString* secondAlertButton;
-(id)createAlertView;
-(UIView*)initWithDelegate:(CustomizeAlertView*)viewControllerObject labelMessage:(NSString*)message firstButton:(NSString*)buttonFirstText secondButton:(NSString*)buttonSecondText;
-(UIView*)initWithBlock:(NSString*)message firstButton:(NSString*)buttonFirstText secondButton:(NSString*)buttonSecondText firstBlock: (void(^)(void))yesBlock  secondBlock:(void(^)(void))noBlock;
@end
