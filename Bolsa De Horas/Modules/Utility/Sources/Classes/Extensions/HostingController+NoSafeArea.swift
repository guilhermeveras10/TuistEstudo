import SwiftUI
import UIKit

public class HostingControllerNoSafeArea<Content>: UIHostingController<AnyView>
    where Content: View
{
    public init(rootView: Content) {
        super.init(rootView: AnyView(rootView))
        disableSafeArea()
    }

    @available(*, unavailable)
    @objc dynamic required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func disableSafeArea() {
        guard let viewClass = object_getClass(view) else {
            return
        }

        let viewSubclassName = String(cString: class_getName(viewClass))
            .appending("_IgnoreSafeArea")

        if let viewSubclass = NSClassFromString(viewSubclassName) {
            object_setClass(view, viewSubclass)
        } else {
            guard
                let viewClassNameUtf8 = (viewSubclassName as NSString)
                .utf8String,
                let viewSubclass = objc_allocateClassPair(
                    viewClass,
                    viewClassNameUtf8,
                    0
                )
            else {
                return
            }

            if let method = class_getInstanceMethod(
                UIView.self,
                #selector(getter: UIView.safeAreaInsets)
            ) {
                let safeAreaInsets: @convention(block) (AnyObject)
                    -> UIEdgeInsets = { _ in
                        .zero
                    }

                class_addMethod(
                    viewSubclass,
                    #selector(getter: UIView.safeAreaInsets),
                    imp_implementationWithBlock(safeAreaInsets),
                    method_getTypeEncoding(method)
                )
            }

            objc_registerClassPair(viewSubclass)
            object_setClass(view, viewSubclass)
        }
    }
}
