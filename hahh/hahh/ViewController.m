//
//  ViewController.m
//  hahh
//
//  Created by 窦心东 on 2016/11/15.
//  Copyright © 2016年 窦心东. All rights reserved.
//

#import "ViewController.h"
#import "starView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor redColor];
    starView *sta = [[starView alloc] initWithFrame:CGRectMake(50, 50, 300, 300)];
    [self.view addSubview:sta];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
