//
//  ModelData.m
//  TestObjectiveCApp
//
//  Created by Sneha Kalariya on 2024-02-11.
//

#import "ModelData.h"

@implementation ModelData

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
