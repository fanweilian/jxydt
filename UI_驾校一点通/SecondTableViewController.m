//
//  SecondTableViewController.m
//  UI_驾校一点通
//
//  Created by fanweilian on 15/10/2.
//  Copyright (c) 2015年 凡为连. All rights reserved.
//

#import "SecondTableViewController.h"
#import "SecondDataModel.h"
#import "RootDataManager.h"
#import "ThirdViewController.h"
@interface SecondTableViewController (){

    NSMutableArray *_dataArray;
    
}

@end

@implementation SecondTableViewController


-(void)dealloc{

    [_dataArray release];
    _dataArray = nil;
    self.pid=nil;
    [super dealloc];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray=[[NSMutableArray alloc]initWithArray:[[RootDataManager sharedManager]detailModelsForPid:self.pid]];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ThirdViewController *vc=[[ThirdViewController alloc]init];
    SecondDataModel *model=_dataArray[indexPath.row];
    vc.sid=model.sid;
    //vc.sid=[_dataArray[indexPath.row] sid];
    vc.title=model.sname;
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *user=@"user";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:user];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:user];
        SecondDataModel *model=_dataArray[indexPath.row];
        cell.textLabel.text=model.sname;
        cell.backgroundColor=[UIColor yellowColor];
        cell.textLabel.textAlignment=NSTextAlignmentRight;
        
    }
    
    return cell;
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
