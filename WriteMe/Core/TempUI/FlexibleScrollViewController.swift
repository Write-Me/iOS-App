//
//  FlexibleScrollViewController.swift
//  WriteMe
//
//  Created by Pets-y on 10.11.2021.
//  Copyright © 2021 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

/// Этот класс реализует возможность добавлять весь необходиммый контент UIViewController-a в контейнер, который реагирет на появление клавиатуры и добвляет возможность скролла.
/// ```
/// class CustomUIViewController: FlexibleScrollViewController
/// ```
class FlexibleScrollViewController: UIViewController {

    private(set) lazy var scrollView: UIScrollView = {
        $0.showsVerticalScrollIndicator = false
        return $0
    }(UIScrollView())

    /// Сюда добавлять весь контент для отображения. Не забываем про top и bottom constraints
    private(set) lazy var contentView: UIView = {
        return $0
    }(UIView())

    /// Для маленьких экранов этим параметром регулируем скролл до низу
    public var minYOffset: CGFloat = 30

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupNotification()
    }

    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }

    private func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
        }

        contentView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalToSuperview().priority(250)
        }
    }

    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let value = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else { return }

        let keyboardFrameInView = view.convert((value).cgRectValue, from: nil)
        let safeAreaFrame = view.safeAreaLayoutGuide.layoutFrame.insetBy(dx: 0, dy: -additionalSafeAreaInsets.bottom)
        let intersection = safeAreaFrame.intersection(keyboardFrameInView)

        additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: intersection.height, right: 0)
        if #available(iOS 13.0, *) {
            minYOffset = UIScreen.main.scale == 3 ? 0 : minYOffset
        }

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
