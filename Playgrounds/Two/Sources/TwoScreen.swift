//
//  OneView.swift
//  One
//
//  Created by Ben Cochran on 2/29/20.
//

import WorkflowUI

public struct TwoScreen: Screen {
    var text: String

    public var viewControllerDescription: ViewControllerDescription {
        return ViewControllerDescription(
            build: { TwoViewController(screen: self) },
            update: { $0.update(with: self) }
        )
    }
}

fileprivate final class TwoViewController: UIViewController {

    private var screen: TwoScreen
    private var label: UILabel!

    init(screen: TwoScreen) {
        self.screen = screen
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with screen: TwoScreen) {
        self.screen = screen

        guard isViewLoaded else {
            return
        }
        label.text = screen.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        label = UILabel()
        view.addSubview(label)

        update(with: screen)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = view.bounds
    }

}
