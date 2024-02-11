//
//  ModelData.h
//  TestObjectiveCApp
//
//  Created by Sneha Kalariya on 2024-02-11.
//

#import <Foundation/Foundation.h>

@class ModelData;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface ModelData : NSObject
@property (nonatomic, copy)   NSString *ip;
@property (nonatomic, copy)   NSString *network;
@property (nonatomic, copy)   NSString *version;
@property (nonatomic, copy)   NSString *city;
@property (nonatomic, copy)   NSString *region;
@property (nonatomic, copy)   NSString *region_code;
@property (nonatomic, copy)   NSString *country;
@property (nonatomic, copy)   NSString *country_name;
@property (nonatomic, copy)   NSString *country_code;
@property (nonatomic, copy)   NSString *country_code_iso3;
@property (nonatomic, copy)   NSString *country_capital;
@property (nonatomic, copy)   NSString *country_tld;
@property (nonatomic, copy)   NSString *continent_code;
@property (nonatomic, assign) BOOL in_eu;
@property (nonatomic, copy)   NSString *postal;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;
@property (nonatomic, copy)   NSString *timezone;
@property (nonatomic, copy)   NSString *utc_offset;
@property (nonatomic, copy)   NSString *country_calling_code;
@property (nonatomic, copy)   NSString *currency;
@property (nonatomic, copy)   NSString *currency_name;
@property (nonatomic, copy)   NSString *languages;
@property (nonatomic, assign) NSInteger country_area;
@property (nonatomic, assign) NSInteger country_population;
@property (nonatomic, copy)   NSString *asn;
@property (nonatomic, copy)   NSString *org;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END

