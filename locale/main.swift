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
    "Currency Symbol": locale.currencySymbol,
    "Script Code": locale.scriptCode,
    "Locale Identifier": locale.identifier,
    "Language Code": locale.languageCode,
    "Variant Code": locale.variantCode,
    "Preffered Languages": Locale.preferredLanguages
] as [String : Any?]

if CMDLineArgs.isEmpty {
    for (key, value) in localeInformation {
        print("\(key): \(value ?? "Not available")")
    }
    exit(0)
}

for arg in CMDLineArgs {
    switch arg {
    case "--help", "-h":
        print("""
locale - by Serena-io
Usage: locale <option>
Options:
    -l, --locale-identifier LOCALE_IDENTIFIER           Specify the locale identifier to print info of, ie en_US. If this is not used, the user's current locale is used instead.

    -a, --all                                           Prints all of the locale's information
    -r, --region                                        Prints the region code of the locale
    -c, --currency                                      Prints the currency code of the locale
    -s, --script-code                                   Prints the script code of the locale
    -L, --language-code                                 Prints the language code of the locale
    -v, --variant-code                                  Prints the variant code of the locale
    -p, --preffered-languages                           Prints the user's preffered languages
    -i, --identifier                                    Prints the locale identifier
""")
    case "--region", "-r":
        print("Region Code: \(locale.regionCode ?? "Not available")")
    case "--currency", "-c":
        print("Currency Code: \(locale.currencyCode ?? "Not available")")
        print("Currency Symbol: \(locale.currencySymbol ?? "Not available")")
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
