//
//  ViewController.m
//  AnimationOfAdvances
//
//  Created by Civet on 2019/5/28.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"
//动画管理类头文件
#import "HMGLTransitionManager.h"
//开门3D动画类型
#import "DoorsTransition.h"
//模拟布匹的动画类型
#import "ClothTransition.h"
//3D变换动画类型
#import "Switch3DTransition.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _parentView = [[UIView alloc] init];
    _parentView.frame = CGRectMake(40, 80, 260, 380);
    [self.view addSubview:_parentView];
    _parentView.backgroundColor = [UIColor orangeColor];
    
    _imageView1 = [[UIImageView alloc] init];
    _imageView1.frame = CGRectMake(0, 0, 260, 380);
    _imageView1.image = [UIImage imageNamed:@"6.jpg"];
    
    _imageView2 = [[UIImageView alloc] init];
    _imageView2.frame = CGRectMake(0, 0, 260, 380);
    _imageView2.image = [UIImage imageNamed:@"7.jpg"];
    
    [_parentView addSubview:_imageView1];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self animMove];
}

- (void)animMove{
    //创建动画管理器对象
    HMGLTransitionManager *manager = [HMGLTransitionManager sharedTransitionManager];
    //动画变换对象
    Switch3DTransition *sAnim = [[Switch3DTransition alloc] init];
    //设置动画方向类型
    [sAnim setTransitionType:Switch3DTransitionLeft];
    
    //动画类型2，开门动画
    DoorsTransition *door = [[DoorsTransition alloc] init];
    //设置动画效果子类型
    [door setTransitionType:DoorsTransitionTypeOpen];
    
    //动画类型3，画布动画
    ClothTransition *cloth = [[ClothTransition alloc] init];
    
    
    //设置动画类型
    //[manager setTransition:sAnim];
//    [manager setTransition:door];
    [manager setTransition:cloth];
    //设置动画视图的容器对象
    [manager beginTransition:_parentView];
    
    static BOOL isFirst = YES;
    if (isFirst) {
        //让第一个图像视图消失
        [_imageView1 removeFromSuperview];
        //将视图2添加到图像容器中
        _imageView2.frame = _imageView1.frame;
        
        [_parentView addSubview:_imageView2];
    }
    else{
        //让第一个图像视图消失
        [_imageView2 removeFromSuperview];
        //将视图2添加到图像容器中
        _imageView1.frame = _imageView2.frame;
        
        [_parentView addSubview:_imageView1];
    }
    isFirst = !isFirst;
    
    
   
    //提交动画运行效果
    [manager commitTransition];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
