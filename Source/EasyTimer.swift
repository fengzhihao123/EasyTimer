//
//  EasyTimer.swift
//  FZHTimer
//
//  Created by 冯志浩 on 2021/11/26.
//

import Foundation
class EasyTimer {
    static let shared = EasyTimer()
    private var timers = [Int: DispatchSourceTimer]()
    
    private init() { }
    
    func resume(deadline: DispatchTime,
                         repeating interval: DispatchTimeInterval = .never,
                         leeway: DispatchTimeInterval = .nanoseconds(0),
                         handler: (()->(Void))?,
                         async: Bool
                        ) -> Int? {
        guard let handler = handler else {
            return nil
        }
        
        let queue = async ? DispatchQueue.global() : DispatchQueue.main
        
        let timer = DispatchSource.makeTimerSource(flags: .strict, queue: queue)
        
        let key = timers.keys.count
        timers[key] = timer
        
        timer.schedule(deadline: deadline, repeating: interval)

        timer.setEventHandler(handler: handler)
        timer.resume()
        
        return key
    }
    
    func cancel(key: Int?) {
        guard let key = key else {
            return
        }
        
        if let timer = timers[key] {
            timer.cancel()
        }
    }
}
