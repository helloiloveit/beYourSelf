//
//  SelectionVC.h
//  BeYourSelf
//
//  Created by huyheo on 9/13/13.
//  Copyright (c) 2013 imac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectionVC : UIViewController <UITableViewDataSource, UITableViewDelegate >{
    	NSMutableDictionary *selectedIndexes;
        NSMutableArray *dataArray;
}

@end
