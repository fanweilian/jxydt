//
//  RootViewController.m
//  UI_驾校一点通
//
//  Created by fanweilian on 15/10/2.
//  Copyright (c) 2015年 凡为连. All rights reserved.
//

#import "RootViewController.h"
#import "RootTableViewController.h"
#define WIDTH self.view bounds.size.width
#define HEIGHT self.view bounds.size.height

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(35, 100,305, 200)];
    imageView.layer.cornerRadius=8;
    imageView.layer.masksToBounds=YES;
    imageView.image=[UIImage imageNamed:@"01"];
    [self.view addSubview:imageView];
    
    
    CGFloat space=20;
    NSArray *titleArray = @[@"交规练习",@"模拟考试",@"我的笔记"];
    NSArray *imageArray = @[@"header_bg",@"toolBar",@"navigationbar"];
    for (int i=0; i<3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame= CGRectMake(50, 320+i*(40+space), 275, 40);
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        button.tag=i;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
    }
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.backBarButtonItem=item;
    
    // Do any additional setup after loading the view.
}
-(void)buttonClick:(UIButton *)button{

    if (button.tag==0) {
        RootTableViewController *vc=[[RootTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:vc animated:YES];
        vc.title=@"交规练习";
        [vc release];
        
    }
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
