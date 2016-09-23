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
@property (nonatomic,strong) id<CustomAlertViewDelegate> delegate;
-(void)createAlertView:(NSString*)message firstButton:(NSString*)textFirstButton secondButton:(NSString*)textSecondButton;
-(UIView*)getAlertView;
-(void)onTappedYesBlock: (void(^)(void))yesBlock;
-(void)onTappedNoBlock: (void(^)(void))noBlock;
@end
