//
//  MovieListViewController.h
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 3/3/18.
//  Copyright © 2018 Kevin Farst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieClient.h"
#import <PromiseKit/PMKFoundation.h>
#import "AppCoordinator.h"

@interface MovieListViewController : UITableViewController

@property (nonatomic, weak) AppCoordinator *coordinator;

- (instancetype)initWithClient:(MovieClient *)client forEndpoint:(NSString *)endpoint;

@end
