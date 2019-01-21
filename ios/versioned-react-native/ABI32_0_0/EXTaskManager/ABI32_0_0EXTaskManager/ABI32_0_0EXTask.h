// Copyright 2018-present 650 Industries. All rights reserved.

#import <ABI32_0_0EXTaskManagerInterface/ABI32_0_0EXTaskManagerInterface.h>
#import <ABI32_0_0EXTaskManagerInterface/ABI32_0_0EXTaskInterface.h>
#import <ABI32_0_0EXTaskManagerInterface/ABI32_0_0EXTaskConsumerInterface.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ABI32_0_0EXTaskDelegate <NSObject>

- (void)executeTask:(nonnull id<ABI32_0_0EXTaskInterface>)task
           withData:(nullable NSDictionary *)data
          withError:(nullable NSError *)error;

@end

@interface ABI32_0_0EXTask : NSObject <ABI32_0_0EXTaskInterface>

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *appId;
@property (nonatomic, strong, readonly) NSString *appUrl;
@property (nonatomic, strong, readonly) id<ABI32_0_0EXTaskConsumerInterface> consumer;
@property (nonatomic, strong) NSDictionary *options;
@property (nonatomic, weak) id<ABI32_0_0EXTaskDelegate> delegate;

- (instancetype)initWithName:(nonnull NSString *)name
                       appId:(nonnull NSString *)appId
                      appUrl:(nonnull NSString *)appUrl
               consumerClass:(Class)consumerClass
                     options:(nullable NSDictionary *)options
                    delegate:(nullable id<ABI32_0_0EXTaskDelegate>)delegate;

- (void)executeWithData:(nullable NSDictionary *)data withError:(nullable NSError *)error;

@end

NS_ASSUME_NONNULL_END
