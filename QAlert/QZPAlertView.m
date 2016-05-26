//
//  QZPAlertView.m
//  QAlert
//
//  Created by qzp on 16/5/26.
//  Copyright © 2016年 qzp. All rights reserved.
//

#import "QZPAlertView.h"

#define ALERTBORDERCOLOR [UIColor lightGrayColor]

@interface QZPAlertView ()

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIView * alertBgView;
@property (nonatomic, strong) UIButton * leftBtn;
@property (nonatomic, strong) UIButton * rightBtn;
@property (nonatomic, strong) UILabel * messageLabel;

@property (nonatomic, strong) UITextField * inputTextField;

@end

@implementation QZPAlertView


- (instancetype)init {
    if (self = [super initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)]) {
        [self initializeUserInterface];
    }
    return self;

}



- (void) initializeUserInterface {
    
    CGFloat w = CGRectGetWidth(self.frame);
    CGFloat h = CGRectGetHeight(self.frame);
    
    self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.1];
    
    self.alertBgView = [[UIView alloc] init];
//    self.alertBgView.center = CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2 - 50);
//    self.alertBgView.bounds = CGRectMake(0, 0, w * 0.9, h * 0.5);
    self.alertBgView.frame = CGRectMake(30, 120.0 / 480.0 * h, w - 60, 200.0 / 480.0 * h);
    self.alertBgView.layer.cornerRadius = 10;
    self.alertBgView.layer.borderWidth = 1;
//    self.alertBgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
       self.alertBgView.layer.borderColor = ALERTBORDERCOLOR.CGColor;
    self.alertBgView.backgroundColor = [UIColor whiteColor];
    [self addSubview: self.alertBgView];
    
    CGFloat bW = CGRectGetWidth(self.alertBgView.frame);
    _titleLabel = [[UILabel alloc] initWithFrame:
                            CGRectMake(0, 5, bW, 30)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.text = @"温馨提示";
    _titleLabel.textColor = [UIColor orangeColor];
    [self.alertBgView addSubview: _titleLabel];
    
    UILabel * hlabel = [[UILabel alloc] initWithFrame:
                        CGRectMake(0, CGRectGetHeight(self.alertBgView.frame)- 45.0 / 480.0 * h, bW, 1)];
    hlabel.backgroundColor =[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1];
    [self.alertBgView addSubview: hlabel];
    
    UILabel * slabel = [[UILabel alloc] initWithFrame:
                        CGRectMake(bW/2-0.5, CGRectGetMaxY(hlabel.frame), 1, CGRectGetHeight(self.alertBgView.frame) - CGRectGetMaxY(hlabel.frame))];
    slabel.backgroundColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1];
    [self.alertBgView addSubview: slabel];
    
    CGFloat bY = CGRectGetMaxY(hlabel.frame);
    CGFloat aH = CGRectGetHeight(self.alertBgView.frame);
    
    _leftBtn = ({
        UIButton * leftBtn = [UIButton buttonWithType: UIButtonTypeSystem];
        leftBtn.frame = CGRectMake(0, bY, bW/2, aH-bY);
        [leftBtn setTitleColor: [UIColor orangeColor] forState: UIControlStateNormal];
        [leftBtn setTitle: @"取消" forState: UIControlStateNormal];
        [self.alertBgView addSubview: leftBtn];
        [leftBtn addTarget: self  action: @selector(buttonClick:) forControlEvents: UIControlEventTouchUpInside];
        leftBtn;
    });
    
    _rightBtn =({
        UIButton * rightBtn = [UIButton buttonWithType: UIButtonTypeSystem];
        rightBtn.frame = CGRectMake(bW/2, bY, bW/2, aH-bY);
        [rightBtn setTitleColor: [UIColor orangeColor] forState: UIControlStateNormal];
        [rightBtn setTitle: @"确定" forState: UIControlStateNormal];
        [self.alertBgView addSubview: rightBtn];
        [rightBtn addTarget: self action: @selector(buttonClick:) forControlEvents: UIControlEventTouchUpInside];
        rightBtn;
    });
    
    


}

- (void) buttonClick: (UIButton *) btn {
    if (btn ==_leftBtn && self.QZPAlertViewButtonClick) {
        self.QZPAlertViewButtonClick(0);
    }
    else if (btn ==_rightBtn && self.QZPAlertViewButtonClick) {
        self.QZPAlertViewButtonClick(1);
    }
    
    [self hide];
    
}


- (void)showInView:(UIView *)view {
    [view addSubview: self];
}

- (void)hide {
    [self removeFromSuperview];
}

#pragma mark -Getter && Setter-

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)setType:(QZPAlertViewType)type {
//    self.type = type;
    
    if (type == QZPAlertViewTypeText) {
        [self.alertBgView addSubview: self.messageLabel];
    }
    else if (type == QZPAlertViewTypeInput) {
        [self.alertBgView addSubview: self.inputTextField];
    }

}

- (void)setTColor:(UIColor *)tColor {
    [self.leftBtn setTitleColor: tColor forState: UIControlStateNormal];
    [self.rightBtn setTitleColor: tColor forState: UIControlStateNormal];
    self.titleLabel.textColor = tColor;
}


- (void)setMessage:(NSString *)message {
//    self.message = message;
    self.messageLabel.text = message;
    
}


- (UILabel *)messageLabel {
    if (!_messageLabel) {
         CGFloat bW = CGRectGetWidth(self.alertBgView.frame);
        _messageLabel = [[UILabel alloc] initWithFrame:
                         CGRectMake(20, 40, bW - 40, CGRectGetHeight(self.alertBgView.frame)-100)];
        _messageLabel.numberOfLines = -1;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _messageLabel;
}

- (UITextField *)inputTextField {
    if (!_inputTextField) {
           CGFloat bW = CGRectGetWidth(self.alertBgView.frame);
        _inputTextField = [[UITextField alloc] initWithFrame:
                           CGRectMake(8, 80, bW - 16, 40)];
        _inputTextField.layer.cornerRadius = 5;
        _inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _inputTextField.layer.borderWidth = 1;
        _inputTextField.layer.borderColor = [UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:244.0/255.0 alpha:1].CGColor;
    }
    return _inputTextField;
}

@end
