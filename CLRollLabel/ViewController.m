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
    
    rollLabel = [[CLRollLabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50) font:[UIFont systemFontOfSize:17] textColor:[UIColor redColor]];
    rollLabel.backgroundColor = [UIColor blackColor];
    rollLabel.text = @"今后贼sjasdjasdjoasdjosadjsao-----1";
    [self.view addSubview:rollLabel];
    
    
    
    [self creatButton];
    [self creatButton2];
}

- (void)creatButton{
    UIButton* button = [UIButton new];
    button.frame = CGRectMake(100, 200, 100, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"更换文字" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)creatButton2{
    UIButton* button = [UIButton new];
    button.frame = CGRectMake(100, 200, 100, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"播放/暂停" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButtonAction2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)clickButtonAction{
    rollLabel.text = @"---add-sa-dsadasda-das-d-as-das-dasd-avcxv-d-ffsfas";
}

- (void)clickButtonAction2:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [rollLabel stopRolling];
    }else{
        [rollLabel startRolling];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
