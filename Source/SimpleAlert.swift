//
//  SimplaAlert.swift
//  Demo
//
//  Created by Phil.Feng on 2020/9/1.
//  Copyright © 2020 Phil.Feng. All rights reserved.
//

import UIKit

struct SimpleAlert {
    static func fzh_alert(title: String,
               message: String,
               @ActionBuilder _ makeActions: () -> [FZHAction]) -> UIAlertController {
        let alert = SimpleAlert()
        let result = alert.makeAlertController(
            title: title,
            message: message,
            style: .alert,
            actions: makeActions()
        )
        return result
    }
    
    func forIn<S: Sequence>(
        _ sequence: S,
        @ActionBuilder makeActions: (S.Element) -> [FZHAction]
    ) -> [FZHAction] {
        return sequence
            .map(makeActions) // [[Action]]
            .flatMap { $0 }   // [Action]
    }
}

private extension SimpleAlert {
    func makeAlertController(title: String,
                             message: String,
                             style: UIAlertController.Style,
                             actions: [FZHAction]) -> UIAlertController {
        let controller = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style
        )
        for action in actions {
            let uiAction = UIAlertAction(title: action.title, style: action.style) { _ in
                action.action()
            }
            controller.addAction(uiAction)
        }
        return controller
    }
}

@_functionBuilder
struct ActionBuilder {
    typealias Component = [FZHAction]
    
    static func buildBlock(_ children: Component...) -> Component {
        return children.flatMap { $0 }
    }
    
    static func buildEither(first component: Component) -> Component {
        return component
    }

    static func buildEither(second component: Component) -> Component {
        return component
    }
}

struct FZHAction {
    let title: String
    let style: UIAlertAction.Style
    let action: () -> Void
}

extension FZHAction {
    static func `default`(_ title: String, action: @escaping () -> Void) -> [FZHAction] {
        return [FZHAction(title: title, style: .default, action: action)]
    }

    static func destructive(_ title: String, action: @escaping () -> Void) -> [FZHAction] {
        return [FZHAction(title: title, style: .destructive, action: action)]
    }

    static func cancel(_ title: String, action: @escaping () -> Void = {}) -> [FZHAction] {
        return [FZHAction(title: title, style: .cancel, action: action)]
    }
}
