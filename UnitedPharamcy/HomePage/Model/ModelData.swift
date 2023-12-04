//
//  ModelData.swift
//  UnitedPharamcy
//
//  Created by Akash Jain on 20/09/23.
//

import Foundation
//MARK: - HomePageCell
enum HomePageCell : String{
    case firstCell = "1,"
    case secondCell = "2,"
    case prescriptionCell = "3,"
    case shopTableCell = "4,"
    case servicesCell = "5,"
    case brandCell = "6,"
    case discountCell = "7,"
    case topSellingCell = "8,"
    case discountBarCell = "9,"
    case mostViewedCell = "10,"
    case slideBarCell = "11,"
    case chosenForYouCell = "8"
}
//MARK: - HomePageCellData
enum HomePageCellData : String{
    case firstCell = "1,"
    case secondCell = "2,"
    case prescriptionCell = "3,"
    case shopTableCell = "4,"
    case servicesCell = "Our services"
    case brandCell = "6,"
    case discountCell = "Banners2"
    case topSellingCell = "Top Selling"
    case discountBarCell = "Banners3"
    case mostViewedCell = "Most Viewed"
    case slideBarCell = "Banners23"
    case chosenForYouCell = "Chosen for you"
}
// MARK: - UnitedPharmacy
struct UnitedPharmacy: Codable {
    let success: Bool?
    let message: String?
    let allowedCurrencies: [AllowedCurrency]?
    let defaultCurrency, tabCategoryView, launcherIconType: String?
    let competitionBanner: CompetitionBanner?
    let darkAppButtonColor, darkAppThemeColor, darkAppThemeTextColor, darkButtonTextColor: String?
    let prefixText, suffixText, clickURL: String?
    let darkAppLogo, darkSplashImage: String?
    let darkAppLogoDominantColor, appButtonColor, appThemeColor, appThemeTextColor: String?
    let buttonTextColor: String?
    let splashImage, appLogo: String?
    let appLogoDominantColor: String?
    let allowIosDownload: Bool?
    let iosDownloadLink: JSONNull?
    let allowAndroidDownload: Bool?
    let androidDownloadLink: JSONNull?
    let showSwatchOnCollection: Bool?
    let walkthroughVersion: String?
    let priceFormat: PriceFormat?
    let themeCode: JSONNull?
    let categories: [Category]?
    let wishlistEnable: Bool?
    let featuredCategories: [FeaturedCategory]?
    let bannerImages: [Banner]?
    let carousel: [Carousel]?
    let websiteData: [WebsiteDatum]?
    let storeData: [StoreDatum]?
    let cmsData: [CMSDatum]?
    let sortOrder: [SortOrder]?
    let themeType: Int?
    let magazineURL: String?
    let waitingText: String?
    let shopByBrands: [ShopByBrand]?
    
    enum CodingKeys: String, CodingKey {
        case success, message, allowedCurrencies, defaultCurrency, tabCategoryView, launcherIconType
        case competitionBanner = "competition_banner"
        case darkAppButtonColor, darkAppThemeColor, darkAppThemeTextColor, darkButtonTextColor
        case prefixText = "prefix_text"
        case suffixText = "suffix_text"
        case clickURL = "clickUrl"
        case darkAppLogo, darkSplashImage, darkAppLogoDominantColor, appButtonColor, appThemeColor, appThemeTextColor, buttonTextColor, splashImage, appLogo, appLogoDominantColor, allowIosDownload, iosDownloadLink, allowAndroidDownload, androidDownloadLink, showSwatchOnCollection, walkthroughVersion, priceFormat, themeCode, categories, wishlistEnable, featuredCategories, bannerImages, carousel, websiteData, storeData, cmsData
        case sortOrder = "sort_order"
        case themeType
        case magazineURL = "magazine_url"
        case waitingText = "waiting_text"
        case shopByBrands = "ShopByBrands"
    }
}
// MARK: - CompetitionBanner
struct CompetitionBanner: Codable {
    let type: String?
    let url: String?
    let redirectType: String?
    let redirectRef, customURL, competitionID: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case type, url
        case redirectType = "redirect_type"
        case redirectRef = "redirect_ref"
        case customURL = "custom_url"
        case competitionID = "competition_id"
    }
}
// MARK: - AllowedCurrency
struct AllowedCurrency: Codable {
    let label, code: String?
}

// MARK: - Banner
struct Banner: Codable {
    let url: String?
    let dominantColor: String?
    let bannerType: BannerType?
    let startDate: String?
    let endDate: EndDate?
    let customURL: String?
    let id, name: String?
    let title: String?
    let competitionID: String?
    let bannerImageurl: String?
    let link: String?
    let categoryName: String?
    
    
    enum CodingKeys: String, CodingKey {
        case url, dominantColor, bannerType, startDate, endDate
        case customURL = "custom_url"
        case id, name, title
        case competitionID = "competition_id"
        case bannerImageurl, link, categoryName
    }
    enum BannerType: String, Codable {
        case asktopharmacist = "asktopharmacist"
        case competition = "competition"
        case ePrescription = "e-prescription"
        case category = "category"
        case product = "product"
        case url = "url"
    }
    
    enum EndDate: String, Codable {
        case the20231130000000 = "2023-11-30 00:00:00"
        case the20231130141200 = "2023-11-30 14:12:00"
        case the20231130141600 = "2023-11-30 14:16:00"
        case the20231231000000 = "2023-12-31 00:00:00"
        case the20241127000000 = "2024-11-27 00:00:00"
        case the20241128141700 = "2024-11-28 14:17:00"
    }
    
    enum StartDate: String, Codable {
        case the20230221000000 = "2023-02-21 00:00:00"
        case the20230511000000 = "2023-05-11 00:00:00"
        case the20230526000000 = "2023-05-26 00:00:00"
        case the20231011191500 = "2023-10-11 19:15:00"
    }
}

// MARK: - Carousel
struct Carousel: Codable {
    let id: String?
    let type: TypeEnum?
    let label: String?
    let productList: [ProductList]?
    let banners: [Banner]?
}

// MARK: - ProductList
struct ProductList: Codable {
    let labelCollection: [JSONAny]?
    let templateBaseurl: String?
    let isOfferApplicable: Bool?
    let configurableData: ConfigurableData?
    let typeID: TypeID?
    let entityID: String?
    let isAvailable: Bool?
    let price, finalPrice: Double?
    let formattedPrice, formattedFinalPrice, name: String?
    let hasRequiredOptions: Bool?
    let thumbNail: String?
    let dominantColor: String?
    let isNew, isInRange, isInWishlist: Bool?
    let wishlistItemID : Int?
    let rating, minAddToCartQty: Int?
    let tierPrice, formattedTierPrice: String?
    let availability: Availability?
    let offerlabel: String?
    let bestofferImage: String?
    let categories: [String]?
    let brand: String?
    
    enum CodingKeys: String, CodingKey {
        case labelCollection = "LabelCollection"
        case templateBaseurl = "template_baseurl"
        case isOfferApplicable, configurableData
        case typeID = "typeId"
        case entityID = "entityId"
        case isAvailable, price, finalPrice, formattedPrice, formattedFinalPrice, name, hasRequiredOptions, thumbNail, dominantColor, isNew, isInRange, isInWishlist
        case wishlistItemID = "wishlistItemId"
        case tierPrice, formattedTierPrice, availability, offerlabel, rating, minAddToCartQty
        case bestofferImage = "bestoffer_image"
        case categories, brand
    }
}

enum Availability: String, Codable {
    case inStock = "In stock"
    case غيرمتوفرحاليا = "غير متوفر حاليا"
    case متوفر = "متوفر"
}
enum Brand: String, Codable {
    case brandDefault = "Default"
    case براون = "براون"
    case لوكس = "لوكس"
}

// MARK: - ConfigurableData
struct ConfigurableData: Codable {
}

enum TypeID: String, Codable {
    case simple = "simple"
}

enum TypeEnum: String, Codable {
    case image = "image"
    case product = "product"
}

// MARK: - Category
struct Category: Codable {
    let id, name: String?
    let hasChildren: Bool?
    let bigMobileImage: String?
    let mediumMobileImage: String?
    let smallMobileImage: String?
    let childCategories: [Category]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, hasChildren
        case bigMobileImage = "big_mobile_image"
        case mediumMobileImage = "medium_mobile_image"
        case smallMobileImage = "small_mobile_image"
        case childCategories
    }
}

// MARK: - CMSDatum
struct CMSDatum: Codable {
    let id, title: String?
}

// MARK: - FeaturedCategory
struct FeaturedCategory: Codable {
    let url: String?
    let dominantColor, categoryID, categoryName: String?
    
    enum CodingKeys: String, CodingKey {
        case url, dominantColor
        case categoryID = "categoryId"
        case categoryName
    }
}

// MARK: - PriceFormat
struct PriceFormat: Codable {
    let pattern: String?
    let precision, requiredPrecision: Double?
    let decimalSymbol, groupSymbol: String?
    let groupLength: Double?
    let integerRequired: Bool?
}

// MARK: - ShopByBrand
struct ShopByBrand: Codable {
    let id: String?
    let url: String?
    let brandImage: String?
    let brandLabel: String?
    let productCount, position: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, url
        case brandImage = "brand_image"
        case brandLabel = "brand_label"
        case productCount = "product_count"
        case position
    }
}

// MARK: - SortOrder
struct SortOrder: Codable {
    let id, layoutID, label, position: String?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case layoutID = "layout_id"
        case label, position, type
    }
}

// MARK: - StoreDatum
struct StoreDatum: Codable {
    let id, name: String?
    let stores: [Store]?
}

// MARK: - Store
struct Store: Codable {
    let id, code, name: String?
}

// MARK: - WebsiteDatum
struct WebsiteDatum: Codable {
    let id, name: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

