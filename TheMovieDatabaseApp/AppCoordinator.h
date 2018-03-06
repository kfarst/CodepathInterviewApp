//
//  AppCoordinator.h
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 3/3/18.
//  Copyright © 2018 Kevin Farst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieTabsViewController.h"
#import "MovieModel.h"

@interface AppCoordinator : NSObject
- (instancetype)initWithRootViewController:(MovieTabsViewController *)rootController;
- (void)start;
- (void)showDetailViewForTableViewController:(UITableViewController *)tableViewController andMovie:(MovieModel *)movie;
@end
