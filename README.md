# move_stargrading
/** imageView1 */
@property (nonatomic,strong) UIImageView *starImageView1;
/** imageView2 */
@property (nonatomic,strong) UIImageView *starImageView2;
/** imageView3 */
@property (nonatomic,strong) UIImageView *starImageView3;
/** imageView4 */
@property (nonatomic,strong) UIImageView *starImageView4;
/** imageView5 */
@property (nonatomic,strong) UIImageView *starImageView5;
/** 星星的背景view */
@property(strong,nonatomic) UIView *star_bgView;
/** 计数label */
@property (nonatomic,strong) UILabel *number_label;
/** fell_label */
@property (nonatomic,strong) UILabel *fell_label;
@property NSInteger count;
@property BOOL can_changeStarNum;
//
//  starView.m
//  hahh
//
//  Created by 窦心东 on 2016/11/15.
//  Copyright © 2016年 窦心东. All rights reserved.
//

#import "starView.h"

#define star_width 20
#define star_topspace 15
#define padding star_width*2
#define starbgView_width star_width*5+padding*4+40
#define starbgView_height 50
@implementation starView
-(UIView *)star_bgView{

    if (_star_bgView == nil) {
        _star_bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, starbgView_width, starbgView_height)];
        _star_bgView.backgroundColor = [UIColor blackColor];
        
    }
    return _star_bgView;
}
-(UIImageView *)starImageView1{
    if (_starImageView1 == nil) {
        _starImageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarUnSelect"]];
        _starImageView1.frame = CGRectMake(star_width, star_topspace, star_width, star_width);
    }
    return _starImageView1;
}
-(UIImageView *)starImageView2{
    if (_starImageView2 == nil) {
        _starImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarUnSelect"]];
        _starImageView2.frame = CGRectMake(star_width*4, star_topspace, star_width, star_width);
    }
    return _starImageView2;
}
-(UIImageView *)starImageView3{
    if (_starImageView3 == nil) {
        _starImageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarUnSelect"]];
        _starImageView3.frame = CGRectMake(star_width*7, star_topspace, star_width, star_width);
    }
    return _starImageView3;
}
-(UIImageView *)starImageView4{
    if (_starImageView4 == nil) {
        _starImageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarUnSelect"]];
        _starImageView4.frame = CGRectMake(star_width*10, star_topspace, star_width, star_width);
    }
    return _starImageView4;
}
-(UIImageView *)starImageView5{
    if (_starImageView5 == nil) {
        _starImageView5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"StarUnSelect"]];
        _starImageView5.frame = CGRectMake(star_width*13, star_topspace, star_width, star_width);
    }
    return _starImageView5;
}
-(UILabel *)number_label{
    if (_number_label == nil) {
        _number_label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 100, 30)];
        _number_label.textAlignment = NSTextAlignmentCenter;
        _number_label.textColor = [UIColor whiteColor];
        _number_label.font = [UIFont systemFontOfSize:13];
        
    }
    return _number_label;
}
-(UILabel *)fell_label{
    if (_fell_label == nil) {
        _fell_label = [[UILabel alloc] initWithFrame:CGRectMake(50, 130, 100, 30)];
        _fell_label.textAlignment = NSTextAlignmentCenter;
        _fell_label.textColor = [UIColor whiteColor];
        _fell_label.font = [UIFont systemFontOfSize:13];
        
    }
    return _fell_label;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if([super initWithFrame:frame])
    {
        [self initData];
    }
    return self;
}

- (instancetype)init
{
    if([super init])
    {
        [self initData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if([super initWithCoder:aDecoder])
    {
        [self initData];
    }
    return self;
}

/** 初始化数据 设置属性*/
- (void)initData
{
    self.count = -1;
}

- (void)layoutSubviews
{
    //添加子视图
    [self addSubview:self.star_bgView];
    [self addSubview:self.number_label];
    [self addSubview:self.fell_label];
    [self.star_bgView addSubview:self.starImageView1];
    [self.star_bgView addSubview:self.starImageView2];
    [self.star_bgView addSubview:self.starImageView3];
    [self.star_bgView addSubview:self.starImageView4];
    [self.star_bgView addSubview:self.starImageView5];
    
}

#pragma mark -- 画进度条

- (void)drawRect:(CGRect)rect
{
    self.number_label.text = @"0分";
    self.fell_label.text = @"很差，不推荐";
    
}


- (void)initdata{
//    self.count = -1;
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint  point = [touch locationInView:self.star_bgView];//在这个范围内的值
    if((point.x>0 && point.x<self.star_bgView.frame.size.width)&&(point.y>0 && point.y<self.star_bgView.frame.size.height)){
        self.can_changeStarNum = YES;//在这个条View范围内 拖动是可以改变星的多少的
        [self changeStarForegroundViewWithPoint:point];
        
    }else{
        self.can_changeStarNum = NO;
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(self.can_changeStarNum){
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.star_bgView];
        [self changeStarForegroundViewWithPoint:point];
    }
    return;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(self.can_changeStarNum){
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.star_bgView];
        [self changeStarForegroundViewWithPoint:point];
        
    }
    self.can_changeStarNum = NO;
    return;
}
-(void)changeStarForegroundViewWithPoint:(CGPoint)point{
    
    NSInteger count = 0;
    count = count + [self changeImg:point.x image:self.starImageView1];
    count = count + [self changeImg:point.x image:self.starImageView2];
    count = count + [self changeImg:point.x image:self.starImageView3];
    count = count + [self changeImg:point.x image:self.starImageView4];
    count = count + [self changeImg:point.x image:self.starImageView5];
    if(count==0){
        count = 0;
        [self.starImageView1 setImage:[UIImage imageNamed:@"StarUnSelect"]];
        self.number_label.text = @"0分";
        self.fell_label.text = @"很差，不推荐";
    }
    self.count = count;
    [self checkCount:count];
    if(count==5){
        self.number_label.text = @"5分";
        self.fell_label.text = @"😄";
    }else{
        self.number_label.text = [NSString stringWithFormat:@"%ld分",count];
    }
}
-(NSInteger)changeImg:(float)x image:(UIImageView*)img{
    
    if(x > img.frame.origin.x){
        [img setImage:[UIImage imageNamed:@"StarSelected"]];
        return 1;
    }else{
        [img setImage:[UIImage imageNamed:@"StarUnSelect"]];
        return 0;
    }
}
-(void)checkCount:(NSInteger)count{
    switch (count) {
    
        case 0:
            self.fell_label.text = @"很差，不推荐";
            break;
            
        case 1:
            self.fell_label.text = @"凑合，可考虑";
            break;
            
        case 2:
            self.fell_label.text = @"一般，还值得";
            break;
            
        case 3:
            self.fell_label.text = @"不错，要推荐";
            break;
            
        case 4:
            self.fell_label.text = @"完美，不错过";
            break;
        default:
            break;
    }
}

@end
