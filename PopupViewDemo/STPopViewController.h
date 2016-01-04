//
//  ListPopViewController.h
//  ListViewPopup
//
//  Created by Sachin on 26/12/15.
//  Copyright © 2015 GlobalLogic. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^DidSelectedRowHandler)(NSInteger row, id selectedObject);

@interface STPopViewController : UIViewController

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic) CGPoint showInPosition;

+ (STPopViewController*)presentInViewController:(UIViewController*)viewController withDataArray:(NSArray*)dataArray inPosition:(CGPoint)point;


- (void)setDidSelectedRowHandler:(DidSelectedRowHandler)didSelectedRowHandler;

@end
