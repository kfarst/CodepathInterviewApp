//
//  MovieModel.h
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 3/3/18.
//  Copyright © 2018 Kevin Farst. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface MovieModel : JSONModel

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *overview;
@property (nonatomic) NSString *posterPath;
@property (nonatomic) NSString *releaseDate;
@property (nonatomic) NSString *backdropPath;

@end
