
#import <Foundation/Foundation.h>

@protocol PDCWaitGroup <NSObject>
@optional
-(void )waitting:(NSInteger )waitCount;
-(void )finish;
@end

@interface PDCWaitGroup : NSObject
/**
 *  等待任务次数-1
 */
-(void )reduceCount;

//-----------------delegate create-----------------
@property (assign, readonly, nonatomic) id<PDCWaitGroup> delegate;

+(instancetype )waitGroupWithWait:(NSInteger )waitCount delegate:(id<PDCWaitGroup> )delegate;
-(instancetype )initWithWait:(NSInteger )waitCount delegate:(id<PDCWaitGroup> )delegate;
+(instancetype )waitGroupWithWait:(NSInteger )waitCount delegate:(id<PDCWaitGroup> )delegate queue:(dispatch_queue_t )queue;
-(instancetype )initWithWait:(NSInteger)waitCount delegate:(id<PDCWaitGroup> )delegate queue:(dispatch_queue_t )queue;

//-----------------block create-----------------
@property (assign, readonly, nonatomic) NSInteger waitCount;

/**
 *  创建方法
 *
 *  @param waitCount 等待次数
 *
 *  @return 实例
 */
+(instancetype )waitGroupWithWait:(NSInteger )waitCount;
-(instancetype )initWithWait:(NSInteger )waitCount;

/**
 *  创建方法
 *
 *  @param waitCount 等待次数
 *  @param queue     自定义队列
 *
 *  @return 实例
 */
+(instancetype )waitGroupWithWait:(NSInteger )waitCount queue:(dispatch_queue_t )queue;
-(instancetype )initWithWait:(NSInteger)waitCount queue:(dispatch_queue_t )queue;

/**
 *  等待中执行，子线程中执行(使用默认的queue)
 *
 *  @param waitting 等待中回调，每发送一次任务-1都会回调
 */
-(void )waitting:(void(^)(NSInteger waitCount)) waitting;


/**
 *  等待完成，即等待次数为0，子线程中执行(使用默认的queue)
 *
 *  @param finish 等待完成回调
 */
-(void )finish:(void (^)()) finish;



@end
