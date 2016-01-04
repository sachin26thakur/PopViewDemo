//
//  PopupView.h
//  ListViewPopup
//
//  Created by Sachin on 25/12/15.
//  Copyright © 2015 GlobalLogic. All rights reserved.
//

#import <UIKit/UIKit.h>



#define ARROW_HEIGHT  15
#define ARROW_WIDTH  28
#define ARROW_CORNER_RADIUS 6

#define CORNER_RADIUS  10
#define LINE_WIDTH  2


#define MARGIN_TABLEVIEW_AND_POPUP 10;
#define POP_UP_SIZE CGSizeMake(200,200)

#define LINE_COLOR [UIColor lightGrayColor]


struct margin_Constant {
    CGFloat top;
    CGFloat lead;
    CGFloat trailing;
    CGFloat bottom;
};

@interface STPopupView : UIControl

@property (nonatomic,assign) CGRect rectangleFrame;

+ (STPopupView *)showInView:(UIView*)view inPosition:(CGPoint)position;

- ( struct margin_Constant)calculateInnerSpace;

@end
