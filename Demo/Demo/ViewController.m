//
//  ViewController.m
//  Demo
//
//  Created by xlx on 15/6/11.
//  Copyright (c) 2015年 xlx. All rights reserved.
//

#import "ViewController.h"
#import "XKeyBoard.h"
@interface ViewController ()
@property (nonatomic,strong) UIView *testview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    CGFloat  y                = self.view.bounds.size.height - 50;
    _testview                 = [[UIView alloc]initWithFrame:CGRectMake(0, y, 320, 50)];
    _testview.backgroundColor = [UIColor redColor];
    [self.view addSubview:_testview];
    
    [XKeyBoard registerKeyBoardShow:self];
    [XKeyBoard registerKeyBoardHide:self];
}

- (void)keyboardWillShowNotification:(NSNotification *)notification
{

    CGRect keyboardEndFrameWindow                         = [XKeyBoard returnKeyBoardWindow:notification];

    double keyboardTransitionDuration                     = [XKeyBoard returnKeyBoardDuration:notification];

    UIViewAnimationCurve keyboardTransitionAnimationCurve = [XKeyBoard returnKeyBoardAnimationCurve:notification];

    [UIView animateWithDuration:keyboardTransitionDuration
                         delay:0
                        options:(UIViewAnimationOptions)keyboardTransitionAnimationCurve << 16
                     animations:^{
                           CGFloat  y                     =self.view.bounds.size.height - 50;
                           CGRect frame                   = CGRectMake(0, y, 320, 50);
                           frame.origin.y                -= keyboardEndFrameWindow.size.height;
                           self.testview.frame = frame;
                 } completion:nil];
   
    
}

- (void)keyboardWillHideNotification:(NSNotification *)notification
{
    CGRect keyboardEndFrameWindow                         = [XKeyBoard returnKeyBoardWindow:notification];

    double keyboardTransitionDuration                     = [XKeyBoard returnKeyBoardDuration:notification];

    UIViewAnimationCurve keyboardTransitionAnimationCurve = [XKeyBoard returnKeyBoardAnimationCurve:notification];
    
    [UIView animateWithDuration:keyboardTransitionDuration
                          delay:0
                        options:(UIViewAnimationOptions)keyboardTransitionAnimationCurve << 16
                     animations:^{
                         CGPoint cen                      = self.testview.center;
                         cen.y                           += keyboardEndFrameWindow.size.height;
                         self.testview.center = cen;
                         
                     } completion:nil];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
