//  Created by Alexander Skorulis on 3/06/2016.
//  Copyright (c) 2016 com.skorulis. All rights reserved.

@import Foundation;

typedef NS_ENUM(NSInteger, SKFeatureFlagType) {
    SKFeatureFlagTypeString,
    SKFeatureFlagTypeBOOL,
    SKFeatureFlagTypeOptions
};

@interface SKFeatureFlagModel : NSObject

@property (nonatomic,readonly) SKFeatureFlagType type;
@property (nonatomic,readonly) NSString* title;
@property (nonatomic,readonly) NSArray* options;
@property (nonatomic) id value;
@property (nonatomic) BOOL logoutRequired;
@property (nonatomic) BOOL restartRequired;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initBoolFlagWithTitle:(NSString*)title;
- (instancetype)initWithType:(SKFeatureFlagType)type title:(NSString*)title options:(NSArray*)options;

- (NSString*)valueString;
- (BOOL)boolValue;

@end
