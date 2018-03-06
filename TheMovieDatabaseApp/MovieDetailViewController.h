//
//  MovieDetailViewController.h
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 3/3/18.
//  Copyright © 2018 Kevin Farst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

@interface MovieDetailViewController : UIViewController

- (instancetype)initWithMovie:(MovieModel *)movie;

@end
