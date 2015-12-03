//
//  RootTableViewController.m
//  UI_驾校一点通
//
//  Created by fanweilian on 15/10/1.
//  Copyright (c) 2015年 凡为连. All rights reserved.
//

#import "RootTableViewController.h"
#import "RootDataModel.h"
#import "RootDataManager.h"
#import "SecondTableViewController.h"
@interface RootTableViewController (){

    NSMutableArray *_dataArray;
}

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _dataArray=[[NSMutableArray alloc]initWithArray:[[RootDataManager sharedManager] allMainDataModels]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"user"];
    [self.tableView reloadData];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.backBarButtonItem=item;
    [item release];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"user"        forIndexPath:indexPath];
   
    RootDataModel *model=_dataArray[indexPath.row];
    cell.textLabel.text=model.pname;
    cell.textLabel.numberOfLines=0;
    if (indexPath.row%2==0) {
        cell.backgroundColor=[UIColor grayColor];
    }

    //cell.detailTextLabel.text=model.pid;
    // Configure the cell...
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    SecondTableViewController *vc=[[SecondTableViewController alloc]init];
    vc.pid=[_dataArray[indexPath.row] pid];
    vc.title=@"题型选择";
    //self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont fontWithName:@"DIN Condensed" size:25], NSForegroundColorAttributeName: [UIColor colorWithRed:64/255.0 green:173/255.0 blue:249/255.0 alpha:1]};
    vc.navigationController.navigationBar.titleTextAttributes=@{NSFontAttributeName:[UIFont fontWithName:@"DIN Condensed" size:25],NSForegroundColorAttributeName: [UIColor redColor]};
    [self.navigationController pushViewController:vc animated:YES];
    [vc release];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
