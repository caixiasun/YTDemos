//
//  TextFieldDemoController.m
//  YTDemos
//
//  Created by caixiasun on 2017/6/12.
//  Copyright © 2017年 com.yatou.test. All rights reserved.
//

#import "TextFieldDemoController.h"

@interface TextFieldDemoController () <UITextFieldDelegate>

@end

@implementation TextFieldDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  1、限制UITextField的输入长度
    UITextField *tf = [UITextField new];
    tf.borderStyle = UITextBorderStyleLine;
    tf.frame = CGRectMake(20, 100, 280, 30);
    [tf addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:tf];
    
    
   
    
}
//1、限制UITextField的输入长度
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)textFieldEditingChanged:(UITextField *)textField {
    
    DLog(@"__111111111___");
    NSString *toBeString = textField.text;
    NSString *lang = [textField.textInputMode primaryLanguage];
    NSInteger max_length = 5;
    // 简体中文输入
    if ([lang isEqualToString:@"zh-Hans"]){
        //获取高亮部分
        UITextRange *selectedRange = [textField markedTextRange];
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position){
            if (toBeString.length > max_length){
                NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:max_length];
                if (rangeIndex.length == 1){
                    textField.text = [toBeString substringToIndex:max_length];
                }else{
                    NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, max_length)];
                    textField.text = [toBeString substringWithRange:rangeRange];
                }
            }
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (toBeString.length > max_length){
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:max_length];
            if (rangeIndex.length == 1){
                textField.text = [toBeString substringToIndex:max_length];
            }else{
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, max_length)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField; {
    NSLog(@"__222222______");
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"______333333____-");
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    NSLog(@"______444444444____-");
    return YES;
}

@end
