//
//  LoginModel.swift
//  SwiftUI Template
//
//  Created by Ilyas Bintang Prayogi on 06/07/25.
//

struct LoginModel: Codable {
    let data: LoginUserData
    let message: String
    let meta: LoginMeta

    init(
        data: LoginUserData = LoginUserData(),
        message: String = "",
        meta: LoginMeta = LoginMeta()
    ) {
        self.data = data
        self.message = message
        self.meta = meta
    }

    enum CodingKeys: String, CodingKey {
        case data
        case message
        case meta
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent(LoginUserData.self, forKey: .data) ?? LoginUserData()
        message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
        meta = try container.decodeIfPresent(LoginMeta.self, forKey: .meta) ?? LoginMeta()
    }
}

struct LoginMeta: Codable {
    let token: String

    init(token: String = "") {
        self.token = token
    }

    enum CodingKeys: String, CodingKey {
        case token
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        token = try container.decodeIfPresent(String.self, forKey: .token) ?? ""
    }
}

struct LoginUserData: Codable {
    let address: String
    let birthdate: String
    let city: String
    let deviceToken: String
    let email: String
    let emergency: LoginUserEmergency
    let gender: String
    let homePhone: String
    let id: Int
    let idNumber: String
    let isActive: Bool
    let isEmailVerified: Bool
    let maritalStatus: String
    let name: String
    let phone: String
    let popupSetupPin: Bool
    let race: String
    let religion: String

    init(
        address: String = "",
        birthdate: String = "",
        city: String = "",
        deviceToken: String = "",
        email: String = "",
        emergency: LoginUserEmergency = LoginUserEmergency(),
        gender: String = "",
        homePhone: String = "",
        id: Int = 0,
        idNumber: String = "",
        isActive: Bool = false,
        isEmailVerified: Bool = false,
        maritalStatus: String = "",
        name: String = "",
        phone: String = "",
        popupSetupPin: Bool = false,
        race: String = "",
        religion: String = ""
    ) {
        self.address = address
        self.birthdate = birthdate
        self.city = city
        self.deviceToken = deviceToken
        self.email = email
        self.emergency = emergency
        self.gender = gender
        self.homePhone = homePhone
        self.id = id
        self.idNumber = idNumber
        self.isActive = isActive
        self.isEmailVerified = isEmailVerified
        self.maritalStatus = maritalStatus
        self.name = name
        self.phone = phone
        self.popupSetupPin = popupSetupPin
        self.race = race
        self.religion = religion
    }

    enum CodingKeys: String, CodingKey {
        case address
        case birthdate
        case city
        case deviceToken = "device_token"
        case email
        case emergency
        case gender
        case homePhone = "home_phone"
        case id
        case idNumber = "id_number"
        case isActive = "is_active"
        case isEmailVerified = "is_email_verified"
        case maritalStatus = "marital_status"
        case name
        case phone
        case popupSetupPin = "popup_setup_pin"
        case race
        case religion
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        address = try container.decodeIfPresent(String.self, forKey: .address) ?? ""
        birthdate = try container.decodeIfPresent(String.self, forKey: .birthdate) ?? ""
        city = try container.decodeIfPresent(String.self, forKey: .city) ?? ""
        deviceToken = try container.decodeIfPresent(String.self, forKey: .deviceToken) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        emergency = try container.decodeIfPresent(LoginUserEmergency.self, forKey: .emergency) ?? LoginUserEmergency()
        gender = try container.decodeIfPresent(String.self, forKey: .gender) ?? ""
        homePhone = try container.decodeIfPresent(String.self, forKey: .homePhone) ?? ""
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        idNumber = try container.decodeIfPresent(String.self, forKey: .idNumber) ?? ""
        isActive = try container.decodeIfPresent(Bool.self, forKey: .isActive) ?? false
        isEmailVerified = try container.decodeIfPresent(Bool.self, forKey: .isEmailVerified) ?? false
        maritalStatus = try container.decodeIfPresent(String.self, forKey: .maritalStatus) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
        popupSetupPin = try container.decodeIfPresent(Bool.self, forKey: .popupSetupPin) ?? false
        race = try container.decodeIfPresent(String.self, forKey: .race) ?? ""
        religion = try container.decodeIfPresent(String.self, forKey: .religion) ?? ""
    }
}

struct LoginUserEmergency: Codable {
    let id: Int
    let name: String
    let phone: String

    init(id: Int = 0, name: String = "", phone: String = "") {
        self.id = id
        self.name = name
        self.phone = phone
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case phone
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        phone = try container.decodeIfPresent(String.self, forKey: .phone) ?? ""
    }
}
