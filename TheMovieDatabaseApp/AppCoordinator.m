//
//  AppCoordinator.m
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 3/3/18.
//  Copyright © 2018 Kevin Farst. All rights reserved.
//

#import "AppCoordinator.h"
#import "MovieTabsViewController.h"
#import "MovieListViewController.h"
#import "MovieDetailViewController.h"
#import "MovieClient.h"

@interface AppCoordinator ()

@property (nonatomic, strong, readonly) MovieTabsViewController *rootController;
@property (nonatomic, strong) NSArray *movieListTypes;
@property (nonatomic, strong) MovieClient *client;

- (NSString *)titleizeEndpoint:(NSString *)endpoint;

@end

@implementation AppCoordinator

- (instancetype)initWithRootViewController:(MovieTabsViewController *)rootController
{
    self = [super init];
    
    if (self != nil) {
        _rootController = rootController;
    }
    
    return self;
}

- (void)start
{
    NSMutableArray *tabBarControllers = [[NSMutableArray alloc] init];
    
    __weak typeof(self) weakSelf = self;
    
    [self.movieListTypes enumerateObjectsUsingBlock: ^(NSString *endpoint, NSUInteger idx, BOOL *stop){
        MovieListViewController *movieListViewController = [[MovieListViewController alloc] initWithClient: weakSelf.client forEndpoint:endpoint];
        movieListViewController.coordinator = self;
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:movieListViewController];
        navigationController.topViewController.title = [weakSelf titleizeEndpoint:endpoint];
        navigationController.tabBarItem.title = [weakSelf titleizeEndpoint:endpoint];
        [tabBarControllers addObject:navigationController];
    }];
    
    self.rootController.viewControllers = tabBarControllers;
}

- (void)showDetailViewForTableViewController:(UITableViewController *)tableViewController andMovie:(MovieModel *)movie
{
    MovieDetailViewController *detailController = [[MovieDetailViewController alloc] initWithMovie:movie];
    [tableViewController.navigationController pushViewController:detailController animated:true];
}

- (NSArray *)movieListTypes
{
    if (_movieListTypes == nil) {
        _movieListTypes = @[
                            @"now_playing",
                            @"popular",
                            @"top_rated",
                            @"upcoming"
                            ];
    }
    return _movieListTypes;
}

- (NSString *)titleizeEndpoint:(NSString *)endpoint
{
    NSMutableArray *capitalizedWords = [[NSMutableArray alloc] init];
    
    [[endpoint componentsSeparatedByString:@"_"] enumerateObjectsUsingBlock: ^(NSString *word, NSUInteger idx, BOOL *stop){
        [capitalizedWords addObject:[word capitalizedString]];
    }];
    
    return [capitalizedWords componentsJoinedByString:@" "];
}

- (MovieClient *)client
{
    if (_client == nil)
    {
        _client = [[MovieClient alloc] init];
    }
    return _client;
}

@end
