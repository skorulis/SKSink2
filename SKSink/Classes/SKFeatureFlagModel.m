//  Created by Alexander Skorulis on 3/06/2016.
//  Copyright (c) 2016 com.skorulis. All rights reserved.

#import "SKFeatureFlagModel.h"

@implementation SKFeatureFlagModel

- (instancetype) initBoolFlagWithTitle:(NSString*)title {
    self = [super init];
    NSParameterAssert(title.length > 0);
    _type = SKFeatureFlagTypeBOOL;
    _title = title;
    _restartRequired = YES;
    return self;
}

- (instancetype) initWithType:(SKFeatureFlagType)type title:(NSString*)title options:(NSArray*)options {
    self = [super init];
    NSParameterAssert(title.length > 0);
    NSParameterAssert(options.count > 0 || type != SKFeatureFlagTypeOptions);
    _type = type;
    _title = title;
    _options = options;
    _restartRequired = YES;
    return self;
}

- (NSString*) valueString {
    NSParameterAssert([_value isKindOfClass:NSString.class]);
    return _value;
}

- (BOOL) boolValue {
    return [_value boolValue];
}

@end
