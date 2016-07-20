//
//  CLRollLabel.h
//  CLRollLabel
//
//  Created by ClaudeLi on 16/5/6.
//  Copyright © 2016年 ClaudeLi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLRollLabel : UIScrollView

@property (nonatomic, strong) NSString *text; // 设置文字
@property (nonatomic, strong) UIColor  *textColor;
@property (nonatomic, strong) UIFont   *font;

@property(nonatomic,assign) float rollSpeed; // 滚动速度，默认0.5

/**
 *  初始化方法
 *  @param font  设置字体
 *  @param color 字体颜色
 */
-(instancetype)initWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)color;

- (instancetype)initWithFrame:(CGRect)frame;

@end
