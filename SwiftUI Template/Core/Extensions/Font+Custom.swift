//
//  Font+Custom.swift
//
//
//  Created by Ilyas Bintang Prayogi on 25/06/24.
//

import SwiftUI

extension Font {
	// Weight: 200
	static func nunitoExtraLight(_ size: CGFloat) -> Font {
		return Font.custom("Nunito-ExtraLight", size: size)
	}
	
	// Weight: 300
	static func nunitoLight(_ size: CGFloat) -> Font {
		return Font.custom("Nunito-Light", size: size)
	}
	
	// Weight: 400
	static func nunitoRegular(_ size: CGFloat) -> Font {
		return Font.custom("Nunito-Regular", size: size)
	}
	
	// Weight: 500
	static func nunitoMedium(_ size: CGFloat) -> Font {
		return Font.custom("Nunito-Medium", size: size)
	}
	
	// Weight: 600
	static func nunitoSemibold(_ size: CGFloat) -> Font {
		return Font.custom("Nunito-SemiBold", size: size)
	}
	
	// Weight: 700
	static func nunitoBold(_ size: CGFloat) -> Font {
		return Font.custom("Nunito-Bold", size: size)
	}
	
	// Weight: 800
	static func nunitoExtraBold(_ size: CGFloat) -> Font {
		return Font.custom("Nunito-ExtraBold", size: size)
	}
	
	// Weight: 900
	static func nunitoBlack(_ size: CGFloat) -> Font {
		return Font.custom("Nunito-Black", size: size)
	}
}
