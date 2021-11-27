//
//  EasyTimer.swift
//  FZHTimer
//
//  Created by 冯志浩 on 2021/11/26.
//

import Foundation

enum ETCancelResult {
    case success, keyIsNil, timerNotFound
}


class EasyTimer {
    static let shared = EasyTimer()
    private var timers = [Int: DispatchSourceTimer]()
    private var semaphore = DispatchSemaphore(value: 1)
    
    private init() { }
    
    func resume(deadline: DispatchTime,
                repeating interval: DispatchTimeInterval = .never,
                handler: (()->(Void))?) -> Int? {
        return resume(deadline: deadline, repeating: interval, leeway: .nanoseconds(0), handler: handler, cancelHandler: nil, async: false)
    }
    
    func resume(deadline: DispatchTime,
                repeating interval: DispatchTimeInterval = .never,
                handler: (()->(Void))?,
                cancelHandler: (()->(Void))?) -> Int? {
        return resume(deadline: deadline, repeating: interval, leeway: .nanoseconds(0), handler: handler, cancelHandler: cancelHandler, async: false)
    }
    
    func resume(deadline: DispatchTime,
                repeating interval: DispatchTimeInterval = .never,
                leeway: DispatchTimeInterval = .nanoseconds(0),
                handler: (()->(Void))?,
                cancelHandler: (()->(Void))?,
                async: Bool
    ) -> Int? {
        guard let handler = handler else {
            return nil
        }
        
        let queue = async ? DispatchQueue.global() : DispatchQueue.main
        let timer = DispatchSource.makeTimerSource(flags: .strict, queue: queue)
        
        let _ = semaphore.wait(timeout: .distantFuture)
        let key = timers.keys.count
        timers[key] = timer
        semaphore.signal()
        
        timer.schedule(deadline: deadline, repeating: interval)
        
        timer.setEventHandler(handler: handler)
        timer.setCancelHandler(handler: cancelHandler)
        timer.resume()
        
        return key
    }
    
    func cancel(key: Int?) -> ETCancelResult {
        guard let key = key else { return .keyIsNil}
        
        let _ = semaphore.wait(timeout: .distantFuture)
        guard let timer = timers[key] else { return .timerNotFound }
        semaphore.signal()
        
        timer.cancel()
        return .success
    }
}
