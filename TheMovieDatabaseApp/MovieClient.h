//
//  MovieClient.h
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 3/3/18.
//  Copyright © 2018 Kevin Farst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PromiseKit/PMKFoundation.h>

@interface MovieClient : NSObject

- (instancetype)init;

- (AnyPromise *)fetchMovieList:(NSString *)listType;

@end
