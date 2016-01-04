//
//  ListPopViewController.m
//  ListViewPopup
//
//  Created by Sachin on 26/12/15.
//  Copyright © 2015 GlobalLogic. All rights reserved.
//

#import "STPopViewController.h"

#import "STPopupView.h"




@interface STPopViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
}


// adjust constraint from popup view 
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailingConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;

//adjust popup size

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *popupWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *popupHeight;

@property (weak, nonatomic) IBOutlet STPopupView *popUp;

@property (nonatomic,copy) DidSelectedRowHandler didSelectedRowHandler;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topPosition;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadPosition;








@end


@implementation STPopViewController


+ (STPopViewController*)presentInViewController:(UIViewController*)viewController withDataArray:(NSArray*)dataArray inPosition:(CGPoint)point{
    
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    STPopViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"ListPopUp"];
    [vc setDataArray:dataArray];
    vc.showInPosition = point;
    [self setPresentationStyleForSelfController:viewController presentingController:vc];
    [viewController presentViewController:vc animated:YES completion:^{
        
    }];
    
    return vc;
}

-(void)setup{
    _popupHeight.constant = POP_UP_SIZE.height;
    _popupWidth.constant = POP_UP_SIZE.width;
    struct margin_Constant margin = [_popUp calculateInnerSpace];
    _topConstraint.constant = margin.top;
    _leadConstraint.constant = margin.lead;
    _bottomConstraint.constant = margin.bottom;
    _trailingConstraint.constant = margin.trailing;
    _topPosition.constant = _showInPosition.y;
    _leadPosition.constant = _showInPosition.x - POP_UP_SIZE.width/2;

    
    
    [_popUp updateConstraints];
}


- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self setup];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *resueIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resueIdentifier];
    
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    id selectedObj = [_dataArray objectAtIndex:indexPath.row];
    _didSelectedRowHandler(indexPath.row,selectedObj);
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDidSelectedRowHandler:(DidSelectedRowHandler)didSelectedRowHandler{
    _didSelectedRowHandler = didSelectedRowHandler;
}


+ (void)setPresentationStyleForSelfController:(UIViewController *)selfController presentingController:(UIViewController *)presentingController
{
        presentingController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        presentingController.providesPresentationContextTransitionStyle = YES;
        presentingController.definesPresentationContext = YES;
        [presentingController setModalPresentationStyle:UIModalPresentationOverCurrentContext];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}



@end
