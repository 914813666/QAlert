//
//  QZPAlertView.h
//  QAlert
//
//  Created by qzp on 16/5/26.
//  Copyright © 2016年 qzp. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, QZPAlertViewType) {
    QZPAlertViewTypeText,
    QZPAlertViewTypeInput,
    QZPAlertViewTypeView
};


@interface QZPAlertView : UIView

@property (nonatomic, assign) QZPAlertViewType  type;
///按钮点击回调
@property (nonatomic, strong) void (^QZPAlertViewButtonClick) (NSInteger index);

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * message;
@property (nonatomic, copy) NSString * leftButtonName;
@property (nonatomic, copy) NSString * rightButtonName;
///当前颜色
@property (nonatomic, strong) UIColor * tColor;

- (void) showInView: (UIView *) view;

- (void) hide;

@end
