//
//  PopupView.m
//  ListViewPopup
//
//  Created by Sachin on 25/12/15.
//  Copyright © 2015 GlobalLogic. All rights reserved.
//

#import "STPopupView.h"




@interface STPopupView (){
    
    CGPoint arrowPosition;
}

@end



@implementation STPopupView

+ (STPopupView *)showInView:(UIView*)view inPosition:(CGPoint)position{
    STPopupView *popView = [[STPopupView alloc] initWithFrame:CGRectZero];
    return popView;
}


- (id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self intialize];
    return self;
}


- (void)awakeFromNib{
    [self intialize];
}


- (void)intialize{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundColor = [UIColor clearColor];
}


- ( struct margin_Constant)calculateInnerSpace{
    
    arrowPosition = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMinY(self.bounds));
    //update lead, right, top and bottom constraint that set margin popview to tableview
    // Drawing code
    _rectangleFrame = CGRectInset(self.bounds, LINE_WIDTH, LINE_WIDTH);
    
    _rectangleFrame = CGRectMake(_rectangleFrame.origin.x, _rectangleFrame.origin.y + ARROW_HEIGHT, CGRectGetWidth(_rectangleFrame), CGRectGetHeight(_rectangleFrame)- ARROW_HEIGHT);
    
    
    struct margin_Constant marginConstant;
    marginConstant.top =   _rectangleFrame.origin.y + MARGIN_TABLEVIEW_AND_POPUP;
    marginConstant.bottom = LINE_WIDTH + MARGIN_TABLEVIEW_AND_POPUP;
    marginConstant.lead = LINE_WIDTH + MARGIN_TABLEVIEW_AND_POPUP;
    marginConstant.trailing = LINE_WIDTH + MARGIN_TABLEVIEW_AND_POPUP;
    
    return marginConstant;
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGFloat xMin = CGRectGetMinX(_rectangleFrame);
    CGFloat yMin = CGRectGetMinY(_rectangleFrame);
    
    CGFloat xMax = CGRectGetMaxX(_rectangleFrame);
    CGFloat yMax = CGRectGetMaxY(_rectangleFrame);
    
    CGFloat cornerOffset = CORNER_RADIUS/3;
    
    UIBezierPath *bazierPath = [UIBezierPath bezierPath];
    
    //draw first curve from top left1 to top left2
    CGPoint startCurvePoint = CGPointMake(xMin, yMin + CORNER_RADIUS);
    CGPoint endCurvePoint = CGPointMake(xMin + CORNER_RADIUS, yMin);
    CGPoint controlPoint1 = CGPointMake(xMin  , yMin + cornerOffset);
    CGPoint controlPoint2 = CGPointMake(xMin + cornerOffset, yMin);
    
    [bazierPath moveToPoint: startCurvePoint];
    [bazierPath addCurveToPoint:endCurvePoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    
    //draw arrow
    startCurvePoint = CGPointMake(arrowPosition.x - ARROW_WIDTH/2, yMin);
    [bazierPath addLineToPoint:startCurvePoint];
    

    
    endCurvePoint = arrowPosition;
    controlPoint1 = CGPointMake(arrowPosition.x - ARROW_CORNER_RADIUS, yMin);
    controlPoint2 = CGPointMake(arrowPosition.x - ARROW_CORNER_RADIUS, arrowPosition.y + ARROW_CORNER_RADIUS);
    [bazierPath addCurveToPoint:endCurvePoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    
    endCurvePoint = CGPointMake(arrowPosition.x + ARROW_WIDTH/2, yMin);
    controlPoint1 = CGPointMake(arrowPosition.x + ARROW_CORNER_RADIUS, arrowPosition.y + ARROW_CORNER_RADIUS);
    controlPoint2 = CGPointMake(arrowPosition.x + ARROW_CORNER_RADIUS, yMin);
    
    [bazierPath addCurveToPoint:endCurvePoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    //draw line from top left2 to top right1
    startCurvePoint = CGPointMake(xMax - CORNER_RADIUS, yMin);
    [bazierPath addLineToPoint:startCurvePoint];
    
    
    //draw curve from top right1 to topr ight2
    endCurvePoint = CGPointMake(xMax, yMin + CORNER_RADIUS);
    controlPoint1 = CGPointMake(xMax - cornerOffset, yMin);
    controlPoint2 = CGPointMake(xMax, yMin + cornerOffset);
    [bazierPath addCurveToPoint:endCurvePoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    //draw line from top right2 to bottom right1
    startCurvePoint = CGPointMake(xMax, yMax - CORNER_RADIUS);
    [bazierPath addLineToPoint:startCurvePoint];
    
    //draw curve from bottom right1 to bottom right2
    endCurvePoint = CGPointMake(xMax - CORNER_RADIUS, yMax);
    controlPoint1 = CGPointMake(xMax, yMax - cornerOffset);
    controlPoint2  = CGPointMake(xMax - cornerOffset, yMax);
    [bazierPath addCurveToPoint:endCurvePoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    //draw line from bottom right2 to bottom left1
    startCurvePoint = CGPointMake(xMin + CORNER_RADIUS, yMax);
    [bazierPath addLineToPoint:startCurvePoint];
    
    //draw curve from bottom left1 to bottom left2
    endCurvePoint = CGPointMake(xMin, yMax - CORNER_RADIUS);
    controlPoint1 = CGPointMake(xMin + cornerOffset, yMax);
    controlPoint2 = CGPointMake(xMin, yMax - cornerOffset);
    [bazierPath addCurveToPoint:endCurvePoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    //draw line from bottom left1 to topleft1
    startCurvePoint = CGPointMake(xMin, yMin + CORNER_RADIUS);
    [bazierPath addLineToPoint:startCurvePoint];
    [bazierPath closePath];
    [[UIColor whiteColor] set];
    [bazierPath fill];
    

    [[UIColor lightGrayColor]set];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, bazierPath.CGPath);
    CGContextSetLineWidth(context, LINE_WIDTH);

    CGContextSetShadowWithColor(context, CGSizeMake(1.0, 1.0), 2.0, LINE_COLOR.CGColor);
    CGContextStrokePath(context);
    
}











@end











