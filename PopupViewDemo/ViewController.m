//
//  ViewController.m
//  PopupViewDemo
//
//  Created by Sachin on 04/01/16.
//  Copyright © 2016 GlobalLogic. All rights reserved.
//

#import "ViewController.h"

#import "STPopViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    
    
    NSArray *dataArr = [NSArray arrayWithObjects:@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thrusday",@"Friday",@"Saturday", nil];
    
    
    STPopViewController *popOver = [STPopViewController presentInViewController:self withDataArray:dataArr inPosition:location];
    [popOver setDidSelectedRowHandler:^(NSInteger row, id selectedObject) {
        NSLog(@"selected object = %@",selectedObject);
    }];
    
}

@end
