//
//  ThirdViewController.m
//  UI_驾校一点通
//
//  Created by fanweilian on 15/10/3.
//  Copyright (c) 2015年 凡为连. All rights reserved.
//

#import "ThirdViewController.h"
#import "RootDataManager.h"
#import "ThirdDataModel.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface ThirdViewController ()<UIAlertViewDelegate>
{

    NSMutableArray *_dataArray;
   // NSMutableArray *_modelArray;
    NSString *_answerString;
    NSInteger _num;
    UIImageView *_imageView;
    
    
    
}
@property (retain, nonatomic) IBOutlet UILabel *serial;
@property (retain, nonatomic) IBOutlet UILabel *manswer;
@property (retain, nonatomic) IBOutlet UILabel *mquestion;

@property (retain, nonatomic) IBOutlet UILabel *mdesc;




@end

@implementation ThirdViewController

- (IBAction)showAnswer:(UIButton *)sender {
    self.manswer.text=_answerString;
    
    
}
- (IBAction)before:(UIButton *)sender {
    self.manswer.text=@"";
    [_imageView removeFromSuperview];
    if (_num>0) {
        _num--;
        ThirdDataModel *model=_dataArray[_num];
        [self updateViewWithModel:model];
        
    }
    if(_num==0) {
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"❤️提示❤️" message:@"已经是第一题了" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
        [alertView release];
        
    }

    
    
    
}
- (IBAction)next:(UIButton *)sender {
    self.manswer.text=nil;
    [_imageView removeFromSuperview];
    if (_num<_dataArray.count-1) {
        _num++;
        ThirdDataModel *model=_dataArray[_num];
        [self updateViewWithModel:model];
    }
    if (_num==_dataArray.count-1) {
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"❤️提示❤️" message:@"已经是最后一题了" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
        [alertView release];
        
    }

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [[NSMutableArray alloc]initWithArray:[[RootDataManager sharedManager]detailMOdelsforSid:self.sid ]];
    _num=0;
    ThirdDataModel *model=_dataArray[_num];
    [self updateViewWithModel:model];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void)updateViewWithModel:(ThirdDataModel *)model{
    self.serial.text=[NSString stringWithFormat:@"第%@题",model.serial];
    NSString *questionString=model.mquestion;
    NSArray *questionArray=[questionString componentsSeparatedByString:@"<BR>"];
    NSString *mquestion = [questionArray componentsJoinedByString:@""];
    self.mquestion.text=mquestion;
    NSDictionary *dict=@{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    CGSize size=[mquestion boundingRectWithSize:CGSizeMake(self.view.bounds.size.width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dict context:nil].size;
    CGRect frame=self.mquestion.frame;
    frame.size.height=size.height;
    _answerString=model.manswer;
    self.mdesc.text=model.mdesc;
    if (model.mimage!=nil) {
        _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(100,frame.origin.y+frame.size.height+40, 120, 100)];
        NSString *imageGif=model.mimage;
        NSArray *image=[imageGif componentsSeparatedByString:@".gif"];
        NSString *imageName=image[0];
        _imageView.image=[UIImage imageNamed:imageName];
        [self.view addSubview:_imageView];
        
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

- (void)dealloc {
    [_serial release];
    [_manswer release];
    [_mquestion release];
    [_mdesc release];
    [_dataArray release];_dataArray=nil;
    [_answerString release];_answerString=nil;
    [super dealloc];
}
@end
