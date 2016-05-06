//
//  ViewController.m
//  CLRollLabel
//
//  Created by ClaudeLi on 16/5/6.
//  Copyright © 2016年 ClaudeLi. All rights reserved.
//

#import "ViewController.h"

#import "CLRollLabel.h"

@interface ViewController (){
    CLRollLabel *rollLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    rollLabel = [[CLRollLabel alloc] initWithFrame:CGRectMake(10, 100, 200, 50) font:[UIFont systemFontOfSize:17] textColor:[UIColor redColor]];
    rollLabel.backgroundColor = [UIColor blackColor];
    rollLabel.text = @"今后贼界差人齎到文字，如依前僭伪，立便发遣出界，不得收接。";
    [self.view addSubview:rollLabel];
    
    
    
    [self creatButton];
}

- (void)creatButton{
    UIButton* button = [UIButton new];
    button.frame = CGRectMake(100, 200, 100, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"更换文字" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)clickButtonAction{
    rollLabel.text = @"---add-sa-dsadasda-das-d-as-das-dasd-avcxv-d-ffsfas";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
