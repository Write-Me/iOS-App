//
//  Icon.swift
//  WriteMe
//
//  Created by Vladimir on 27.09.2020.
//  Copyright © 2020 Vladimir Mikhaylov. All rights reserved.
//

import UIKit

public struct Icon: Equatable {

  private init(methodSignature: String, image: UIImage?, highlightedImage: UIImage?) {
    self.methodSignature = methodSignature
    self.image = image
    self.highlightedImage = highlightedImage
  }

  // MARK: - Properties

  /// A string to keep track of how the struct is initialized.
  /// It's used internally to avoid the breaking Equatable changes of Icon (as enum) until v2.0.
  private let methodSignature: String

  /// The image for the normal state.
  public let image: UIImage?

  /// The image for the highlighted state.
  public let highlightedImage: UIImage?

  // MARK: -

  /// Returns `Icon` with an image of the given name for the normal state.
  /// The "-highlighted" suffix is appended to the name for the highlighted image.
  ///
  /// - Parameters:
  ///   - name: The name of the image asset.
  ///   - bundle: The bundle containing the image file or asset catalog. Specify nil to search the app’s main bundle.
  ///   - traitCollection: The traits associated with the intended environment for the image. Specify nil to use the traits associated with the main screen.
  public static func named(_ name: String, in bundle: Bundle? = nil, compatibleWith traitCollection: UITraitCollection? = nil) -> Self {
    return Icon(
      methodSignature: "\(#function):\(name)",
      image: UIImage(named: name, in: bundle, compatibleWith: traitCollection),
      highlightedImage: UIImage(named: name + "-highlighted", in: bundle, compatibleWith: traitCollection)
    )
  }

  /// Returns `Icon` with an image for the normal state. The image for the highlighted state is nil.
  /// A method to provide backward compatiblility with the previous enum `case image(UIImage)`.
  public static func image(_ image: UIImage) -> Self {
    return Icon(methodSignature: #function, image: image, highlightedImage: nil)
  }

  /// Returns `Icon` with images for the normal and highlighted states.
  /// A method to provide backward compatiblility with the previous enum `case images(normal: UIImage, highlighted: UIImage)`.
  public static func images(normal: UIImage, highlighted: UIImage) -> Self {
    return Icon(methodSignature: #function, image: normal, highlightedImage: highlighted)
  }

  /// Returns `Icon` with the specified SF Symbol as the image for the normal state.
  /// The image for the highlighted state is nil.
  ///
  /// - Parameters:
  ///   - name: The name of the system symbol image.
  ///   - configuration: The configuration to specify traits and other details that define the variant of image.
  @available(iOS 13.0, tvOS 13.0, *)
  public static func sfSymbol(_ name: String, withConfiguration configuration: UIImage.Configuration? = nil) -> Self {
    // Make sure the image scales with the Dynamic Type settings.
    let fallback = UIImage.SymbolConfiguration(textStyle: .body)
    return Icon(
      methodSignature: "\(#function):\(name)",
      image: UIImage(systemName: name, withConfiguration: configuration ?? fallback),
      highlightedImage: nil
    )
  }

}
