//  Created by Alexander Skorulis on 29/07/2016.
//  Copyright © 2016 Alex Skorulis. All rights reserved.

#import <Foundation/Foundation.h>
#import "SKFeatureFlagModel.h"

@interface SKFeatureFlagService : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFlags:(NSArray<SKFeatureFlagModel*> *)flags;

- (NSArray*)allFlags;
- (SKFeatureFlagModel*)flagWithName:(NSString*)name;
- (id)valueForFlagName:(NSString*)flagName;
- (BOOL)boolForFlagName:(NSString*)flagName;

- (void)setFlag:(SKFeatureFlagModel*)flag value:(id)value;
- (void)cycleFlag:(SKFeatureFlagModel*)flag;
- (void)toggleFlag:(SKFeatureFlagModel*)flag;

- (SKFeatureFlagModel*)addOptionsFlag:(NSString*)title default:(NSString*)value options:(NSArray*)options;
- (SKFeatureFlagModel*)addBoolFlag:(NSString*)title;


@end
