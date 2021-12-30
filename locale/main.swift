//
//  main.swift
//  locale
//
//  Created by Raeda Niroukh on 30/12/2021.
//

import Foundation

let CMDLineArgs = Array(CommandLine.arguments.dropFirst())

var locale: Locale {
    if CMDLineArgs.contains("--locale-identifier") || CMDLineArgs.contains("-l") {
        let argToParse = CMDLineArgs.contains("-l") ? "-l" : "--locale-identifier"
        guard let index = CMDLineArgs.firstIndex(of: argToParse), CMDLineArgs.indices.contains(index + 1) else {
            return Locale.current
        }
        return Locale(identifier: CMDLineArgs[index + 1])
    }
    
    return Locale.current
}

let localeInformation = [
    "Region Code": locale.regionCode,
    "Currency Code": locale.currencyCode,
    "Script Code": locale.scriptCode,
    "Locale Identifier": locale.identifier,
    "Language Code": locale.languageCode,
    "Variant Code": locale.variantCode,
    "Preffered Languages": Locale.preferredLanguages
] as [String : Any?]

for arg in CMDLineArgs {
    switch arg {
    case "--region", "-r":
        print("Region Code: \(locale.regionCode ?? "Not available")")
    case "--currency", "-c":
        print("Currency Code: \(locale.currencyCode ?? "Not available")")
    case "--script-code", "-s":
        print("Script Code: \(locale.scriptCode ?? "Not available")")
    case "--language-code", "-L":
        print("Language Code: \(locale.languageCode ?? "Not available")")
    case "--variant-code", "-v":
        print("Variant Code: \(locale.variantCode ?? "Not available")")
    case "--identifier", "-i":
        print("Locale Identifier: \(locale.identifier)")
    case "--preffered-languages":
        print("Preffered Languages: \(Locale.preferredLanguages)")
    case "--all", "-a":
        for (key, value) in localeInformation {
            print("\(key): \(value ?? "Not available")")
        }
    default:
        break
    }
}
