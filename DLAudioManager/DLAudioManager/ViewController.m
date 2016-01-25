//
//  ViewController.m
//  DLAudioManager
//
//  Created by macbook on 16/1/25.
//  Copyright © 2016年 DLD. All rights reserved.
//

#import "ViewController.h"

#import "DLAudioManager.h"

#define __ScreenWidth self.view.frame.size.width
#define __ScreenHeight self.view.frame.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *titles = @[@"好.wav",@"好极了.wav",@"很好.wav",@"难以置信.wav"];
    for (int i = 0; i<2; i++) {
        for (int j= 0; j<2; j++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(j*__ScreenWidth/2, i*__ScreenHeight/2, __ScreenWidth/2, __ScreenHeight/2);
            [button setTitle:titles[2*i+j] forState:UIControlStateNormal];
            button.tag = 100+2*i+j;
            [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
        }
    }
}

- (void)btnClick:(UIButton *)sender{
    NSArray *titles = @[@"好.wav",@"好极了.wav",@"很好.wav",@"难以置信.wav"];
    [[DLAudioManager sharedManager] playSoundEffect:titles[sender.tag-100]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
